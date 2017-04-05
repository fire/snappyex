ExUnit.start()

defmodule Snappyex.TestHelper do
  @pool_timeout 15_000
  @timeout 5_000
  defmacro query(stat, params, opts \\ []) do
    quote do
      case Snappyex.prepare_execute(var!(context)[:pid], "", unquote(stat),
                          unquote(params), unquote(defaults(opts))) do
        {:ok, _, result} -> result.rows
        {:error, err} -> err
      end
    end
  end

  defmacro prepare(name, stat, params, opts \\ []) do
    quote do
      case Snappyex.prepare(var!(context)[:pid], unquote(name), unquote(stat),
                                     unquote(params), unquote(opts)) do
        {:ok, query} -> 
          query
        {:error, err} -> err
      end
    end
  end

  defmacro execute(query, params, opts \\ []) do
    quote do
      case Snappyex.execute(var!(context)[:pid], unquote(query),
                                       unquote(params), unquote(opts)) do
        {:ok, %Snappyex.Result{rows: nil}} -> :ok
        {:ok, %Snappyex.Result{rows: rows}} -> rows
        {:error, err} -> err
      end
    end
  end

  defmacro close(query, opts \\ []) do
    quote do
      case Snappyex.close(var!(context)[:pid], unquote(query),
                                     unquote(opts)) do
        {:ok, nil} -> :ok
        {:error, err} -> err
      end
    end
  end

  defmacro transaction(fun, opts \\ []) do
    quote do
      Snappyex.transaction(var!(context)[:pid], unquote(fun),
                                      unquote(opts))
    end
  end

  def snappydata_address() do
    Application.fetch_env!(:snappyex, :hostname) 
  end

  def snappydata_port() do
    Application.fetch_env!(:snappyex, :port)
  end

  def snappydata_properties() do
     %{"load-balance" => "false", "sync-commits" => "true"}
  end
  
  def capture_log(fun) do
    Logger.remove_backend(:console)
    fun.()
    Logger.add_backend(:console, flush: true)
  end

  defp defaults(opts) do
    opts
    |> Keyword.put(:pool_timeout, @pool_timeout)
    |> Keyword.put(:timeout, @timeout)
  end
end
