defmodule Snappyex do

  alias Snappyex.Query
  @timeout 15_000
  def start_link(opts) do
    DBConnection.start_link(Snappyex.Protocol, defaults(opts))
  end

  def execute(conn, query, params, opts \\ []) do
    DBConnection.execute(conn, query, params, defaults(opts))
  end

  def close(conn, query, opts \\ []) do
    DBConnection.close(conn, query, defaults(opts))
  end

  def prepare_execute(conn, name, statement, params, opts \\ []) do
    query = %Query{name: name, statement: statement}
    DBConnection.prepare_execute(conn, query, params, defaults(opts))
  end

  def prepare(conn, name, statement, opts \\ []) do
      query = %Query{name: name, statement: statement}
    DBConnection.prepare(conn, query, defaults(opts))
  end

  @doc """
  Returns a supervisor child specification for a DBConnection pool.
  """
  @spec child_spec(Keyword.t) :: Supervisor.Spec.spec
  def child_spec(opts) do
    DBConnection.child_spec(Snappyex.Protocol, opts)
  end

  defp defaults(opts) do
    opts
    |> Keyword.put_new(:pool_timeout, @timeout)
  end
end
