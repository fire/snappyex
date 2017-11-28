defmodule(SnappyData.Thrift.SnappyType) do
  @moduledoc("Auto-generated Thrift enum snappydata.SnappyType")
  defmacro(unquote(:boolean)()) do
    1
  end
  defmacro(unquote(:tinyint)()) do
    2
  end
  defmacro(unquote(:smallint)()) do
    3
  end
  defmacro(unquote(:integer)()) do
    4
  end
  defmacro(unquote(:bigint)()) do
    5
  end
  defmacro(unquote(:float)()) do
    6
  end
  defmacro(unquote(:double)()) do
    7
  end
  defmacro(unquote(:decimal)()) do
    8
  end
  defmacro(unquote(:char)()) do
    9
  end
  defmacro(unquote(:varchar)()) do
    10
  end
  defmacro(unquote(:longvarchar)()) do
    11
  end
  defmacro(unquote(:date)()) do
    12
  end
  defmacro(unquote(:time)()) do
    13
  end
  defmacro(unquote(:timestamp)()) do
    14
  end
  defmacro(unquote(:binary)()) do
    15
  end
  defmacro(unquote(:varbinary)()) do
    16
  end
  defmacro(unquote(:longvarbinary)()) do
    17
  end
  defmacro(unquote(:blob)()) do
    18
  end
  defmacro(unquote(:clob)()) do
    19
  end
  defmacro(unquote(:sqlxml)()) do
    20
  end
  defmacro(unquote(:array)()) do
    21
  end
  defmacro(unquote(:map)()) do
    22
  end
  defmacro(unquote(:struct)()) do
    23
  end
  defmacro(unquote(:nulltype)()) do
    24
  end
  defmacro(unquote(:json)()) do
    25
  end
  defmacro(unquote(:java_object)()) do
    26
  end
  defmacro(unquote(:other)()) do
    27
  end
  def(value_to_name(1)) do
    {:ok, :boolean}
  end
  def(value_to_name(2)) do
    {:ok, :tinyint}
  end
  def(value_to_name(3)) do
    {:ok, :smallint}
  end
  def(value_to_name(4)) do
    {:ok, :integer}
  end
  def(value_to_name(5)) do
    {:ok, :bigint}
  end
  def(value_to_name(6)) do
    {:ok, :float}
  end
  def(value_to_name(7)) do
    {:ok, :double}
  end
  def(value_to_name(8)) do
    {:ok, :decimal}
  end
  def(value_to_name(9)) do
    {:ok, :char}
  end
  def(value_to_name(10)) do
    {:ok, :varchar}
  end
  def(value_to_name(11)) do
    {:ok, :longvarchar}
  end
  def(value_to_name(12)) do
    {:ok, :date}
  end
  def(value_to_name(13)) do
    {:ok, :time}
  end
  def(value_to_name(14)) do
    {:ok, :timestamp}
  end
  def(value_to_name(15)) do
    {:ok, :binary}
  end
  def(value_to_name(16)) do
    {:ok, :varbinary}
  end
  def(value_to_name(17)) do
    {:ok, :longvarbinary}
  end
  def(value_to_name(18)) do
    {:ok, :blob}
  end
  def(value_to_name(19)) do
    {:ok, :clob}
  end
  def(value_to_name(20)) do
    {:ok, :sqlxml}
  end
  def(value_to_name(21)) do
    {:ok, :array}
  end
  def(value_to_name(22)) do
    {:ok, :map}
  end
  def(value_to_name(23)) do
    {:ok, :struct}
  end
  def(value_to_name(24)) do
    {:ok, :nulltype}
  end
  def(value_to_name(25)) do
    {:ok, :json}
  end
  def(value_to_name(26)) do
    {:ok, :java_object}
  end
  def(value_to_name(27)) do
    {:ok, :other}
  end
  def(value_to_name(v)) do
    {:error, {:invalid_enum_value, v}}
  end
  def(name_to_value(:boolean)) do
    {:ok, 1}
  end
  def(name_to_value(:tinyint)) do
    {:ok, 2}
  end
  def(name_to_value(:smallint)) do
    {:ok, 3}
  end
  def(name_to_value(:integer)) do
    {:ok, 4}
  end
  def(name_to_value(:bigint)) do
    {:ok, 5}
  end
  def(name_to_value(:float)) do
    {:ok, 6}
  end
  def(name_to_value(:double)) do
    {:ok, 7}
  end
  def(name_to_value(:decimal)) do
    {:ok, 8}
  end
  def(name_to_value(:char)) do
    {:ok, 9}
  end
  def(name_to_value(:varchar)) do
    {:ok, 10}
  end
  def(name_to_value(:longvarchar)) do
    {:ok, 11}
  end
  def(name_to_value(:date)) do
    {:ok, 12}
  end
  def(name_to_value(:time)) do
    {:ok, 13}
  end
  def(name_to_value(:timestamp)) do
    {:ok, 14}
  end
  def(name_to_value(:binary)) do
    {:ok, 15}
  end
  def(name_to_value(:varbinary)) do
    {:ok, 16}
  end
  def(name_to_value(:longvarbinary)) do
    {:ok, 17}
  end
  def(name_to_value(:blob)) do
    {:ok, 18}
  end
  def(name_to_value(:clob)) do
    {:ok, 19}
  end
  def(name_to_value(:sqlxml)) do
    {:ok, 20}
  end
  def(name_to_value(:array)) do
    {:ok, 21}
  end
  def(name_to_value(:map)) do
    {:ok, 22}
  end
  def(name_to_value(:struct)) do
    {:ok, 23}
  end
  def(name_to_value(:nulltype)) do
    {:ok, 24}
  end
  def(name_to_value(:json)) do
    {:ok, 25}
  end
  def(name_to_value(:java_object)) do
    {:ok, 26}
  end
  def(name_to_value(:other)) do
    {:ok, 27}
  end
  def(name_to_value(k)) do
    {:error, {:invalid_enum_name, k}}
  end
  def(value_to_name!(value)) do
    {:ok, name} = value_to_name(value)
    name
  end
  def(name_to_value!(name)) do
    {:ok, value} = name_to_value(name)
    value
  end
  def(meta(:names)) do
    [:boolean, :tinyint, :smallint, :integer, :bigint, :float, :double, :decimal, :char, :varchar, :longvarchar, :date, :time, :timestamp, :binary, :varbinary, :longvarbinary, :blob, :clob, :sqlxml, :array, :map, :struct, :nulltype, :json, :java_object, :other]
  end
  def(meta(:values)) do
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27]
  end
  def(member?(1)) do
    true
  end
  def(member?(2)) do
    true
  end
  def(member?(3)) do
    true
  end
  def(member?(4)) do
    true
  end
  def(member?(5)) do
    true
  end
  def(member?(6)) do
    true
  end
  def(member?(7)) do
    true
  end
  def(member?(8)) do
    true
  end
  def(member?(9)) do
    true
  end
  def(member?(10)) do
    true
  end
  def(member?(11)) do
    true
  end
  def(member?(12)) do
    true
  end
  def(member?(13)) do
    true
  end
  def(member?(14)) do
    true
  end
  def(member?(15)) do
    true
  end
  def(member?(16)) do
    true
  end
  def(member?(17)) do
    true
  end
  def(member?(18)) do
    true
  end
  def(member?(19)) do
    true
  end
  def(member?(20)) do
    true
  end
  def(member?(21)) do
    true
  end
  def(member?(22)) do
    true
  end
  def(member?(23)) do
    true
  end
  def(member?(24)) do
    true
  end
  def(member?(25)) do
    true
  end
  def(member?(26)) do
    true
  end
  def(member?(27)) do
    true
  end
  def(member?(_)) do
    false
  end
  def(name?(:boolean)) do
    true
  end
  def(name?(:tinyint)) do
    true
  end
  def(name?(:smallint)) do
    true
  end
  def(name?(:integer)) do
    true
  end
  def(name?(:bigint)) do
    true
  end
  def(name?(:float)) do
    true
  end
  def(name?(:double)) do
    true
  end
  def(name?(:decimal)) do
    true
  end
  def(name?(:char)) do
    true
  end
  def(name?(:varchar)) do
    true
  end
  def(name?(:longvarchar)) do
    true
  end
  def(name?(:date)) do
    true
  end
  def(name?(:time)) do
    true
  end
  def(name?(:timestamp)) do
    true
  end
  def(name?(:binary)) do
    true
  end
  def(name?(:varbinary)) do
    true
  end
  def(name?(:longvarbinary)) do
    true
  end
  def(name?(:blob)) do
    true
  end
  def(name?(:clob)) do
    true
  end
  def(name?(:sqlxml)) do
    true
  end
  def(name?(:array)) do
    true
  end
  def(name?(:map)) do
    true
  end
  def(name?(:struct)) do
    true
  end
  def(name?(:nulltype)) do
    true
  end
  def(name?(:json)) do
    true
  end
  def(name?(:java_object)) do
    true
  end
  def(name?(:other)) do
    true
  end
  def(name?(_)) do
    false
  end
end