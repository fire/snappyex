defmodule Snappyex.Protocol do
  @moduledoc false
  @behaviour DBConnection
  @repeatable_read 3
  require Logger
  alias Snappyex.Query, as: Query
  alias Snappyex.Cache, as: Cache
  alias SnappyData.Thrift, as: Thrift
  alias SnappyData.Thrift.SnappyDataService.Binary.Framed.Client
  @time_out 5_000

  def connect(opts) do
    Process.flag(:trap_exit, true)
    {:ok, hostname} = Keyword.fetch(opts, :hostname)
    {:ok, port} = Keyword.fetch(opts, :port)
    port = to_string(port)
    port = port |> String.to_integer
    status = Client.start_link(hostname, port)
    connect_start_link(status, opts)
  end

  defp connect_start_link({:error, err}, _opts) do
    {:error, err}
  end

  defp connect_start_link({:ok, pid}, opts) do
    token_size = Keyword.get(opts, :token_size, 16)
    use_string_for_decimal = Keyword.get(opts, :use_string_for_decimal, false)
    {:ok, user_name} = Keyword.fetch(opts, :username)
    {:ok, password} = Keyword.fetch(opts, :password)
    require SnappyData.Thrift.SecurityMechanism
    security = Keyword.get(opts, :security, Thrift.SecurityMechanism.plain)
    conn_properties = Keyword.get(opts, :properties, %{"load-balance" => "false", "sync-commits" => "true"})
    {:ok, client_host_name} = :inet.gethostname
    client_host_name = to_string(client_host_name)
    {:ok, properties} = Client.open_connection_with_options(pid,
      %Thrift.OpenConnectionArgs{client_host_name: client_host_name,
                                 client_id: "ElixirClient1|0x" <> Base.encode16(inspect self()),
                                 user_name: user_name,
                                 password: password,
                                 security: security,
                                 properties: conn_properties,
                                 token_size: token_size,
                                 use_string_for_decimal: use_string_for_decimal,
                                 for_xa: false},
      gen_server_opts: [timeout: @time_out])
    state = [process_id: pid,
             connection_id: properties.conn_id,
             client_host_name: properties.client_host_name,
             client_id: properties.client_id,
             cache: Cache.new(),
             token: properties.token]
    {:ok, state}
  end

  def checkout(state) do
    {:ok, state}
  end

  def checkin(state) do
    {:ok, state}
  end

  def disconnect(_, state) do
    {:ok, process_id} = Keyword.fetch(state, :process_id)
    Client.close(process_id)
    :ok
  end

  @doc """
  Elixir Thrift handles reconnections. So ping is redundant.
  """
  @spec ping(state :: any) ::
  {:ok, new_state :: any} |
  {:disconnect, Exception.t, new_state :: any}
  def ping(state) do
    {:ok, state}
  end

  defp prepare_insert(statement_id, num_params, %Snappyex.Query{name: name, ref: ref} = query, state) do
    {:ok, cache} = Keyword.fetch(state, :cache)
    ref = ref || make_ref()
    true = Cache.insert_new(cache, name, statement_id, ref)
    %{query | ref: ref, num_params: num_params}
  end

  def handle_info(_msg, state) do
    {:ok, state}
  end

  def handle_next(_query, _cursor, _, _state) do
    raise "Next is not implemented"
  end

  def handle_first(_query, _cursor, _opts, _state) do
    raise "First is not implemented"
  end

  def handle_deallocate(_, _cursor, _, _state) do
    raise "Deallocate cursor is not implemented"
  end


  def handle_declare(_, _cursor, _, _state) do
    raise "Declare cursor is not implemented"
  end

  def handle_commit(_opts, state) do
    query = %Snappyex.Query{statement: 'COMMIT'}
    {:ok, prepared_query, state} = handle_prepare(query, [], state)
    params = Map.put_new(Map.new, :params, %SnappyData.Thrift.Row{values: []})
    handle_execute(prepared_query, params , [], state)
  end

  def handle_rollback(_opts, state) do
    query = %Snappyex.Query{statement: 'ROLLBACK'}
    {:ok, prepared_query, state} = handle_prepare(query, [], state)
    params = Map.put_new(Map.new, :params, %SnappyData.Thrift.Row{values: []})
    handle_execute(prepared_query, params , [], state)
  end

  def handle_begin(opts, state) do
    {:ok, process_id} = Keyword.fetch(state, :process_id)
    {:ok, token} = Keyword.fetch(state, :token)
    {:ok, flags} = Map.fetch(opts, :flags)
    {:ok, connection_id} = Keyword.fetch(state, :connection_id)
    case Client.begin_transaction_with_options(process_id,
          connection_id,
          @repeatable_read,
          flags,
          token,
          gen_server_opts: [timeout: @time_out]) do
      {:ok, result} ->
        {:ok, result, state}
      {:error, error} ->
        {:error, error, state}
    end
  end

  def handle_close(query, _opts, state) do
    {:ok, process_id} = Keyword.fetch(state, :process_id)
    {:ok, token} = Keyword.fetch(state, :token)
    case close_lookup(query, state) do
      {:close, statement_id} ->
        Client.close_statement(process_id, statement_id, token)
        {:ok, nil, state}
      :closed ->
        {:ok, nil, state}
    end
  end

  defp close_lookup(%Snappyex.Query{name: name}, state) do
    {:ok, cache} = Keyword.fetch(state, :cache)
    case Cache.take(cache, name) do
      {statement_id, _ref} when is_integer(statement_id) ->
        {:close, statement_id}
      nil ->
        :closed
    end
  end

  def handle_execute(%Query{} = query, params, _opts, state) do
    case execute_lookup(query, state) do
      {:execute, statement_id, query} ->
        execute(statement_id, query, params, state)
      {:prepare_execute, query} ->
        prepare_execute(&prepare(query, &1), params, state)
      {:close_prepare_execute, statement_id, query} ->
        prepare_execute(&close_prepare(statement_id, query, &1), params, state)
    end
  end

  defp prepare_execute(prepare, params, state) do
    case prepare.(state) do
      {:ok, query, state} ->
        statement_id = prepare_execute_lookup(query, state)
        execute(statement_id, query, params, state)
      {err, _, _} = error when err in [:error, :disconnect] ->
        error
    end
  end

  def execute(_statement_id, query, params, state) do
    {:ok, process_id} = Keyword.fetch(state, :process_id)
    {:ok, token} = Keyword.fetch(state, :token)
    case execute_lookup(query, state) do
      {:execute, statement_id, _query} ->
        case Client.execute_prepared_with_options(process_id,
              statement_id,
              params,
              Map.new,
              %SnappyData.Thrift.StatementAttrs{},
              token,
              gen_server_opts: [timeout: @time_out]) do
          {:ok, statement} ->
            {:ok, %Snappyex.Result{rows: statement.result_set}, state}
          {:error, error} ->
            {:disconnect, error, state}
        end
       {:error, error} ->
         {:disconnect, error.exceptionData, state}
         disconnect(query, state)
       {:prepare_execute, query} ->
         prepare_execute(&prepare(query, &1), params, state)
       {:close_prepare_execute, statement_id, query} ->
         prepare_execute(&close_prepare(statement_id, query, &1), params, state)
     end
    end

 defp prepare_execute_lookup(%Query{name: name}, state) do
    {:ok, cache} = Keyword.fetch(state, :cache)
    Cache.id(cache, name)
  end

  defp execute_lookup(%Query{name: name, ref: ref} = query, state) do
    {:ok, cache} = Keyword.fetch(state, :cache)
    case Cache.lookup(cache, name) do
      {statement_id, ^ref} ->
        {:execute, statement_id, query}
      {statement_id, _} ->
        Cache.delete(cache, name)
        {:close_prepare_execute, statement_id, query}
      nil ->
        {:prepare_execute, query}
    end
  end
  def handle_prepare(%Query{types: :nil} = query, _opts, state) do
    case prepare_lookup(query, state) do
      {:prepare, query} ->
        prepare(query, state)
      {:close_prepare, statement_id, query} ->
        close_prepare(statement_id, query, state)
    end
  end

  defp close_prepare(statement_id, %Snappyex.Query{statement: _statement} = query, state) do
    {:ok, process_id} = Keyword.fetch(state, :process_id)
    {:ok, token} = Keyword.fetch(state, :token)
    Client.close_statement_with_options(
      process_id,
      statement_id,
      token,
      gen_server_opts: [timeout: @time_out])
    prepare(query, state)
  end

  def prepare(query, state) do
      {:ok, process_id} = Keyword.fetch(state, :process_id)
      {:ok, connection_id} = Keyword.fetch(state, :connection_id)
      {:ok, token} = Keyword.fetch(state, :token)
      output_parameters = Map.get(query, :output_parameters, Map.new)
      _statement_attributes = Map.get(query,
        :statement_attributes,
        %SnappyData.Thrift.StatementAttrs{})
      case Client.prepare_statement_with_options(
            process_id,
            connection_id,
            to_string(query.statement),
            output_parameters,
            nil,
            token,
            gen_server_opts: [timeout: @time_out]) do
        {:ok, prepared_result} ->
            prepare_result(query, prepared_result, state)
        {:error, error} ->
          {:disconnect, error.exceptionData.reason, state}
      end
  end

  defp decode_row_set_names(metadata) do
    Enum.map(metadata, fn descriptor ->
      %SnappyData.Thrift.ColumnDescriptor{name: name} = descriptor
      name
    end)
  end
  alias SnappyData.Thrift.SnappyType, as: SnappyType  
  defp decode_row_set_types(metadata) do
    for type <- metadata do
      {:ok, type} = SnappyType.value_to_name(type.type)
      type
    end
  end

  defp parameter_meta_data(nil), do: []
  defp parameter_meta_data(data), do: data
  defp result_set_meta_data(nil), do: []
  defp result_set_meta_data(data), do: data

  defp num_params(nil), do: 0
  defp num_params(data), do: Enum.count(data)
  defp prepare_result(query, prepared_result, state) do
    num_params = num_params(prepared_result.parameter_meta_data)
    parameter_meta_data = parameter_meta_data(prepared_result.parameter_meta_data)
    result_set_meta_data = result_set_meta_data(prepared_result.result_set_meta_data)
    param_formats = decode_row_set_types(parameter_meta_data)
    result_formats = decode_row_set_types(result_set_meta_data)
    columns = decode_row_set_names(result_set_meta_data)
    types = decode_row_set_names(parameter_meta_data)
    query = prepare_insert(prepared_result.statement_id,
      num_params,
      %Query{query | ref: make_ref(),
             param_formats: param_formats,
             result_formats: result_formats,
             columns: columns,
             types: types},
      state)
    {:ok, query, state}
  end

  defp prepare_lookup(%Query{name: name} = query, state) do
    {:ok, cache} = Keyword.fetch(state, :cache)
    case Cache.take(cache, name) do
      {statement_id, _ref} when is_integer(statement_id) ->
        {:close_prepare, statement_id, query}
      nil ->
        {:prepare, query}
    end
  end
end
