defmodule LoginTest do
  use ExUnit.Case
  import Snappyex.TestHelper

  alias Snappyex, as: S
  require SnappyData.Thrift.SecurityMechanism
  setup do
    opts = [ hostname: snappydata_address(), client_id: "ElixirClient1|0x" <> Base.encode16(inspect self()),
             port: snappydata_port(), username: "APP", password: "APP",  security: SnappyData.Thrift.SecurityMechanism.plain, 
     token_size: 16, use_string_for_decimal: false, properties: snappydata_properties()]
    {:ok, pid} = S.start_link(opts)
    Process.flag(:trap_exit, true)
    {:ok, [pid: pid]}
  end

  test "login cleartext password", context do
    capture_log fn ->
    assert [[1]] == query("SELECT 1", [])
    end
  end
end
