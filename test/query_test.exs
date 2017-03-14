# Tests from https://github.com/elixir-ecto/postgrex/blob/master/test/query_test.exs
# Copyright 2013 Eric Meadows-Jönsson
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

defmodule QueryTest do
  use ExUnit.Case
  import Snappyex.TestHelper
#  require Decimal
  alias Snappyex, as: S
  require SnappyData.Thrift.SecurityMechanism

  setup do
    opts = [ backoff_type: :stop, sync_connect: true, host: snappydata_address(), client_id: "ElixirClient1|0x" <> Base.encode16(inspect self()), 
             port: snappydata_port(), user_name: "APP", password: "APP",  security: SnappyData.Thrift.SecurityMechanism.plain, 
     token_size: 16, use_string_for_decimal: false, properties: snappydata_properties()]
    {:ok, pid} = S.start_link(opts)    
    Process.flag(:trap_exit, true)
    {:ok, [pid: pid]}
  end

  test "iodata", context do
    params = []
    assert [[123]] == query(["S", ?E, ["LEC"|"T"], " ", '123'], params)
  end

  test "decode basic types", context do
    params = []
    assert [[nil]] ==  query("SELECT NULL", params)
    assert [[true, false]] == query("SELECT true, false", params)
    assert [["e"]] == query("SELECT 'e'", params)
    assert [["ẽ"]] == query("SELECT 'ẽ'", params)
    assert [[42]] == query("SELECT 42", params)
    assert [[42.0]] == query("SELECT CAST(42 AS FLOAT)", params)
    #assert [[:NaN]] == query("SELECT CAST('NaN' AS FLOAT)", params)
    #assert [[:inf]] == query("SELECT CAST('inf' AS FLOAT)", params)
    #assert [[:"-inf"]] == query("SELECT CAST('-inf'::float)", params)    
    assert [[42.0]] == query("SELECT CAST(42 AS DOUBLE)", params)
    assert [["ẽric"]] == query("SELECT 'ẽric'", params)    
    assert [["ẽric"]] == query("SELECT CAST('ẽric' AS VARCHAR(10))", params)
    assert  [[%SnappyData.Thrift.BlobChunk{chunk: "\\001\\002\\003", last: true,
              lob_id: nil, offset: 0, total_length: 12}]] 
              == query("SELECT CAST('\\001\\002\\003' AS BINARY)", params)
  end
 
  #test "decode decimal", context do
   # assert [[Decimal.new("42")]] == query("SELECT CAST(42 AS DECIMAL)", [])
   # assert [[Decimal.new("42.0000000000")]] == query("SELECT CAST(42.0 AS DECIMAL(100, 10))", [])
   # assert [[Decimal.new("1.001")]] == query("SELECT CAST(1.001 AS DECIMAL)", [])
   # assert [[Decimal.new("0.4242")]] == query("SELECT CAST(0.4242 AS DECIMAL)", [])
   # assert [[Decimal.new("42.4242")]] == query("SELECT CAST(42.4242 AS DECIMAL)", [])
   # assert [[Decimal.new("12345.12345")]] == query("SELECT CAST(12345.12345 AS DECIMAL)", [])
   # assert [[Decimal.new("0.00012345")]] == query("SELECT CAST(0.00012345 AS DECIMAL)", [])
   # assert [[Decimal.new("1000000000.0")]] == query("SELECT CAST(1000000000.0 AS DECIMAL)", [])
   # assert [[Decimal.new("1000000000.1")]] == query("SELECT CAST(1000000000.1 AS DECIMAL)", [])
   # assert [[Decimal.new("123456789123456789123456789")]] == query("SELECT CAST(123456789123456789123456789 AS DECIMAL)", [])
   # assert [[Decimal.new("123456789123456789123456789.123456789")]] == query("SELECT CAST(123456789123456789123456789.123456789 AS DECIMAL)", [])
   # assert [[Decimal.new("1.1234500000")]] == query("SELECT CAST(1.1234500000 AS DECIMAL)", [])
   # assert [[Decimal.new("NaN")]] == query("SELECT CAST('NaN' AS DECIMAL)", [])
  #end

  test "decode time", context do
    assert [[{0, 0, 0, 0}]] ==
           query("VALUES TIME('00:00:00')", [])
    assert [[{1, 2, 3, 0}]] ==
           query("VALUES TIME('01:02:03')", [])
    assert [[{23, 59, 59, 0}]] ==
           query("VALUES TIME('23:59:59')", [])
    #assert [[{0, 0, 0, 123000}]] !=
    #       query("VALUES TIME('00:00:00.123')", [])
    #assert [[{0, 0, 0, 123456}]] ==
    #       query("VALUES TIME('00:00:00.123456')", [])
    #assert [[{1, 2, 3, 123456}]] ==
    #       query("VALUES TIME('01:02:03.123456')", [])

    #assert [[{hour: 2, min: 5, sec: 6, usec: 0}]] ==
    #       query("SELECT timetz '04:05:06+02'", [])
    #assert [[{hour: 22, min: 5, sec: 6, usec: 0}]] ==
    #       query("SELECT timetz '00:05:06+02'", [])
    #assert [[{hour: 1, min: 5, sec: 6, usec: 0}]] ==
    #       query("SELECT timetz '23:05:06-02'", [])
  end

  test "decode date", context do
    assert [[Timex.to_datetime({{0000,  12,  30}, {0, 0, 0}}, "Etc/UTC")]] ==
           query("VALUES DATE('0001-01-01')", [])
    assert [[Timex.to_datetime({{0001,  2,  1}, {0, 0, 0}}, "Etc/UTC")]] ==
           query("VALUES DATE('0001-02-03')", [])
    assert [[Timex.to_datetime({{2013, 9, 23}, {0, 0, 0}}, "Etc/UTC")]] == 
           query("VALUES DATE('2013-09-23')", [])
  end
  
  test "insert query", context do
    query("DROP TABLE IF EXISTS SNAPPYEX_TEST.TEST_INSERT", [])   
    nil = query("CREATE TABLE SNAPPYEX_TEST.TEST_INSERT (id int primary key, text varchar(10))", [])  
    assert nil == query("INSERT INTO SNAPPYEX_TEST.TEST_INSERT (id, text) VALUES (?, ?)", [43, "fortythree"])
    assert [[43, "fortythree"]] == query("SELECT * FROM SNAPPYEX_TEST.TEST_INSERT", [])
    query("DROP TABLE SNAPPYEX_TEST.TEST_INSERT", [])
  end

  test "insert prepared query", context do
    query("DROP TABLE IF EXISTS SNAPPYEX_TEST.TEST_INSERT_PREPARED", [])   
    nil = query("CREATE TABLE SNAPPYEX_TEST.TEST_INSERT_PREPARED (id int primary key, text varchar(10))", [])  
    query = prepare("Insert", "INSERT INTO SNAPPYEX_TEST.TEST_INSERT_PREPARED (id, text) VALUES (?, ?)", [])
    assert :ok == execute(query, [43, "fortythree"])
    assert [[43, "fortythree"]] == query("SELECT * FROM SNAPPYEX_TEST.TEST_INSERT_PREPARED", [])
    query("DROP TABLE SNAPPYEX_TEST.TEST_INSERT_PREPARED", [])
  end

  test "prepare, execute and close", context do
    query = prepare("42", "SELECT 42", [])
    assert [[42]] == execute(query, [])
    assert [[42]] == execute(query, [])
    assert :ok == close(query)
    assert [[42]] == query("SELECT 42", [])
  end
end
