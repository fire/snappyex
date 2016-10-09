defmodule LoginTest do
  use ExUnit.Case
  import Snappyex.TestHelper

  alias Snappyex, as: S

  setup do
    opts = [ host: "localhost", clientID: "ElixirClient1|0x" <> Base.encode16(inspect self), 
     port: 1531, userName: "APP", password: "APP",  security: Snappyex.Model.SecurityMechanism.plain, 
     tokenSize: 16, useStringForDecimal: false, properties: :dict.new()]
    {:ok, pid} = S.start_link(opts)
    {:ok, [pid: pid]}
  end

  test "login cleartext password", context do
    Process.flag(:trap_exit, true)
    capture_log fn ->
    params = Map.put_new(Map.new, :params, Snappyex.Model.Row.new(values: []))
    assert [[1]] == query('SELECT 1', params)
    end
  end
  #Tests where snappyex cannot connect will fail
end
