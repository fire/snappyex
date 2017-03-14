defmodule Snappyex.Protocol do
  @moduledoc false
  @behaviour DBConnection
  @repeatable_read 3
  require Logger
  alias SnappyData.Thrift.SnappyDataService.Binary.Framed.Client
  @time_out 5_000

  def connect(opts) do
    Process.flag(:trap_exit, true)
    {:ok, host} = Keyword.fetch(opts, :host)
    {:ok, port} = Keyword.fetch(opts, :port)
    status = Client.start_link(host, port)
    connect_start_link(status, opts)
  end

   def connect_start_link({:error, err}, _opts) do
    {:error, err}
  end

  def connect_start_link({:ok, pid}, opts) do
    {:ok, token_size} = Keyword.fetch(opts, :token_size)
    use_string_for_decimal = Keyword.get(opts, :use_string_for_decimal, false)
    {:ok, user_name} = Keyword.fetch(opts, :user_name)
    {:ok, password} = Keyword.fetch(opts, :password)
    {:ok, security} = Keyword.fetch(opts, :security)
    {:ok, conn_properties} = Keyword.fetch(opts, :properties)
    {:ok, client_host_name} = :inet.gethostname
    client_host_name = to_string(client_host_name)
    {:ok, properties} = Client.open_connection_with_options(pid, %SnappyData.Thrift.OpenConnectionArgs{client_host_name: client_host_name, client_id: "ElixirClient1|0x" <> Base.encode16(inspect self()), user_name: user_name, password: password, security: security, properties: conn_properties, token_size: token_size, use_string_for_decimal: use_string_for_decimal, for_xa: false}, gen_server_opts: [timeout: @time_out])
    state = [process_id: pid, connection_id: properties.conn_id, client_host_name: properties.client_host_name, client_id: properties.client_id, cache: Snappyex.Cache.new(), token: properties.token, opts: opts]
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

  @spec ping(state :: any) ::
  {:ok, new_state :: any} |
  {:disconnect, Exception.t, new_state :: any}
  def ping(state) do
    query  = %Snappyex.Query{statement: 'SELECT 1'}
    {:ok, prepared_query, state} = Snappyex.Protocol.handle_prepare(query, [], state)
    case Snappyex.Protocol.handle_execute(prepared_query, [] , [], state) do
      {:ok, _, state} ->
        {:ok, state}
      {:disconnect, err, state} ->
        {:disconnect, err.exceptionData, state}
    end
  end

  defp prepare_insert(statement_id, num_params, %Snappyex.Query{name: name, ref: ref} = query, state) do
    {:ok, cache} = Keyword.fetch(state, :cache)
    ref = ref || make_ref()
    true = Snappyex.Cache.insert_new(cache, name, statement_id, ref)
    %{query | ref: ref, num_params: num_params}
  end

  def handle_commit(_opts, state) do
    query = %Snappyex.Query{statement: 'COMMIT'}
    {:ok, prepared_query, state} = Snappyex.Protocol.handle_prepare(query, [], state)
    params = Map.put_new(Map.new, :params, %SnappyData.Thrift.Row{values: []})
    Snappyex.Protocol.handle_execute(prepared_query, params , [], state)
  end
  def handle_begin(opts, state) do
    {:ok, process_id} = Keyword.fetch(state, :process_id)
    {:ok, token} = Keyword.fetch(state, :token)
    {:ok, flags} = Map.fetch(opts, :flags)
    {:ok, connection_id} = Keyword.fetch(state, :connection_id)  
    case Client.begin_transaction_with_options(process_id, connection_id, @repeatable_read, flags, token,  gen_server_opts: [timeout: @time_out]) do
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
    case Snappyex.Cache.take(cache, name) do
      {statement_id, _ref} when is_integer(statement_id) ->
        {:close, statement_id}
      nil ->
        :closed
    end
  end

  def handle_execute(query, params, _opts, state) do
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
        case Client.execute_prepared_with_options(process_id, statement_id, params, Map.new, %SnappyData.Thrift.StatementAttrs{}, token, gen_server_opts: [timeout: @time_out]) do
          {:ok, statement} ->            
            result = Map.new
            result = Map.put_new(result, :rows, statement.result_set)
            {:ok, result, state}
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

 defp prepare_execute_lookup(%Snappyex.Query{name: name}, state) do
    {:ok, cache} = Keyword.fetch(state, :cache)
    Snappyex.Cache.id(cache, name)
  end

  defp execute_lookup(%Snappyex.Query{name: name, ref: ref} = query, state) do
    {:ok, cache} = Keyword.fetch(state, :cache)
    case Snappyex.Cache.lookup(cache, name) do
      {statement_id, ^ref} ->
        {:execute, statement_id, query}
      {statement_id, _} ->
        Snappyex.Cache.delete(cache, name)
        {:close_prepare_execute, statement_id, query}
      nil ->
        {:prepare_execute, query}
    end
  end

  def handle_prepare(query, _opts, state) do
    query = unless query.types == nil do
       query
    else
        %{query | types: []}
    end
    case prepare_lookup(query, state) do
      {:prepared, query} ->
        prepare(query, state)      
      {:prepare, query} ->
        prepare(query, state)
      {:close_prepare, statement_id, query} ->
        close_prepare(statement_id, query, state)
    end
  end

  defp close_prepare(statement_id, %Snappyex.Query{statement: _statement} = query, state) do
    {:ok, process_id} = Keyword.fetch(state, :process_id)
    {:ok, token} = Keyword.fetch(state, :token)
    Client.close_statement_with_options(process_id, statement_id, token, gen_server_opts: [timeout: @time_out])
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
        process_id, connection_id, to_string(query.statement), output_parameters,
        nil, token, gen_server_opts: [timeout: @time_out]) do
        {:ok, prepared_result} ->
            prepare_result(query, prepared_result, state)
        {:error, error} ->
          {:disconnect, error.exceptionData.reason, state}
      end
  end

  defp prepare_result(query, prepared_result, state) do
    num_params = case prepared_result.result_set_meta_data do
      nil -> 0
      result -> Enum.count(result)
    end
    query = unless query.types == nil do
         query
      else
         %{query | types: []}
    end
    query = unless prepared_result.parameter_meta_data == nil do
              %{query | param_formats: prepared_result.parameter_meta_data}
            else
              %{query | param_formats: []}
            end
            query = unless prepared_result.result_set_meta_data == nil do
              %{query | result_formats: prepared_result.result_set_meta_data}
            else
              %{query | result_formats: []}
            end
            query = unless query.param_formats == nil do
              %{query | types: Snappyex.Query.query_columns_list(prepared_result.parameter_meta_data)}
            else
              %{query | types: []}
            end
            query = unless query.types == nil do
               query
       else 
        %{query | types: []}
     end
    query = prepare_insert(prepared_result.statement_id, num_params, %Snappyex.Query{query | ref: make_ref()}, state)
    {:ok, query, state}
  end

  defp prepare_lookup(%Snappyex.Query{name: name} = query, state) do
    {:ok, cache} = Keyword.fetch(state, :cache)
    case Snappyex.Cache.take(cache, name) do
      {statement_id, ref} when is_integer(statement_id) ->
        {:prepared,  %{query | ref: ref}}
      nil ->
        {:prepare, query}
    end
  end
end
