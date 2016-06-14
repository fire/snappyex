defmodule Snappyex do
  @timeout 5000

  alias Snappyex.Query
  def start_link(opts) do
    DBConnection.start_link(Snappyex.Protocol, opts)
  end

  def disconnect(err, state) do
    case DBConnection.disconnect(err, state) do
      {error, err} ->
        raise err
      other ->
        other
    end
  end

  def execute(conn, query, params, opts \\ []) do
    DBConnection.execute(conn, query, params, defaults(opts))
  end

  def prepare_execute(conn, statement, params, opts \\ []) do
    query = %Query{name: "", statement: statement}
    case DBConnection.prepare_execute(conn, query, params, defaults(opts)) do
      {:ok, %Snappyex.Query{} = out_query, %{} = result} -> {:ok, {out_query, result}}
      {:error, %ArgumentError{} = err} ->
        raise err
      other ->
        other
    end
  end

  def prepare(conn, query, opts \\ []) do
    case DBConnection.prepare(conn, query, defaults(opts)) do
      {:error, %ArgumentError{} = err} ->
        raise err
      other ->
        other
    end
  end

  defp defaults(opts) do
    Keyword.put_new(opts, :timeout, @timeout)
  end
end
