defmodule(SnappyData.Thrift.ServiceMetaDataCall) do
  @moduledoc("Auto-generated Thrift enum snappydata.ServiceMetaDataCall")
  defmacro(unquote(:catalogs)()) do
    1
  end
  defmacro(unquote(:schemas)()) do
    2
  end
  defmacro(unquote(:tables)()) do
    3
  end
  defmacro(unquote(:tabletypes)()) do
    4
  end
  defmacro(unquote(:columns)()) do
    5
  end
  defmacro(unquote(:tableprivileges)()) do
    6
  end
  defmacro(unquote(:columnprivileges)()) do
    7
  end
  defmacro(unquote(:primarykeys)()) do
    8
  end
  defmacro(unquote(:importedkeys)()) do
    9
  end
  defmacro(unquote(:exportedkeys)()) do
    10
  end
  defmacro(unquote(:crossreference)()) do
    11
  end
  defmacro(unquote(:procedures)()) do
    12
  end
  defmacro(unquote(:functions)()) do
    13
  end
  defmacro(unquote(:procedurecolumns)()) do
    14
  end
  defmacro(unquote(:functioncolumns)()) do
    15
  end
  defmacro(unquote(:attributes)()) do
    16
  end
  defmacro(unquote(:typeinfo)()) do
    17
  end
  defmacro(unquote(:supertypes)()) do
    18
  end
  defmacro(unquote(:supertables)()) do
    19
  end
  defmacro(unquote(:versioncolumns)()) do
    20
  end
  defmacro(unquote(:clientinfoprops)()) do
    21
  end
  defmacro(unquote(:pseudocolumns)()) do
    22
  end
  def(value_to_name(1)) do
    {:ok, :catalogs}
  end
  def(value_to_name(2)) do
    {:ok, :schemas}
  end
  def(value_to_name(3)) do
    {:ok, :tables}
  end
  def(value_to_name(4)) do
    {:ok, :tabletypes}
  end
  def(value_to_name(5)) do
    {:ok, :columns}
  end
  def(value_to_name(6)) do
    {:ok, :tableprivileges}
  end
  def(value_to_name(7)) do
    {:ok, :columnprivileges}
  end
  def(value_to_name(8)) do
    {:ok, :primarykeys}
  end
  def(value_to_name(9)) do
    {:ok, :importedkeys}
  end
  def(value_to_name(10)) do
    {:ok, :exportedkeys}
  end
  def(value_to_name(11)) do
    {:ok, :crossreference}
  end
  def(value_to_name(12)) do
    {:ok, :procedures}
  end
  def(value_to_name(13)) do
    {:ok, :functions}
  end
  def(value_to_name(14)) do
    {:ok, :procedurecolumns}
  end
  def(value_to_name(15)) do
    {:ok, :functioncolumns}
  end
  def(value_to_name(16)) do
    {:ok, :attributes}
  end
  def(value_to_name(17)) do
    {:ok, :typeinfo}
  end
  def(value_to_name(18)) do
    {:ok, :supertypes}
  end
  def(value_to_name(19)) do
    {:ok, :supertables}
  end
  def(value_to_name(20)) do
    {:ok, :versioncolumns}
  end
  def(value_to_name(21)) do
    {:ok, :clientinfoprops}
  end
  def(value_to_name(22)) do
    {:ok, :pseudocolumns}
  end
  def(value_to_name(v)) do
    {:error, {:invalid_enum_value, v}}
  end
  def(name_to_value(:catalogs)) do
    {:ok, 1}
  end
  def(name_to_value(:schemas)) do
    {:ok, 2}
  end
  def(name_to_value(:tables)) do
    {:ok, 3}
  end
  def(name_to_value(:tabletypes)) do
    {:ok, 4}
  end
  def(name_to_value(:columns)) do
    {:ok, 5}
  end
  def(name_to_value(:tableprivileges)) do
    {:ok, 6}
  end
  def(name_to_value(:columnprivileges)) do
    {:ok, 7}
  end
  def(name_to_value(:primarykeys)) do
    {:ok, 8}
  end
  def(name_to_value(:importedkeys)) do
    {:ok, 9}
  end
  def(name_to_value(:exportedkeys)) do
    {:ok, 10}
  end
  def(name_to_value(:crossreference)) do
    {:ok, 11}
  end
  def(name_to_value(:procedures)) do
    {:ok, 12}
  end
  def(name_to_value(:functions)) do
    {:ok, 13}
  end
  def(name_to_value(:procedurecolumns)) do
    {:ok, 14}
  end
  def(name_to_value(:functioncolumns)) do
    {:ok, 15}
  end
  def(name_to_value(:attributes)) do
    {:ok, 16}
  end
  def(name_to_value(:typeinfo)) do
    {:ok, 17}
  end
  def(name_to_value(:supertypes)) do
    {:ok, 18}
  end
  def(name_to_value(:supertables)) do
    {:ok, 19}
  end
  def(name_to_value(:versioncolumns)) do
    {:ok, 20}
  end
  def(name_to_value(:clientinfoprops)) do
    {:ok, 21}
  end
  def(name_to_value(:pseudocolumns)) do
    {:ok, 22}
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
    [:catalogs, :schemas, :tables, :tabletypes, :columns, :tableprivileges, :columnprivileges, :primarykeys, :importedkeys, :exportedkeys, :crossreference, :procedures, :functions, :procedurecolumns, :functioncolumns, :attributes, :typeinfo, :supertypes, :supertables, :versioncolumns, :clientinfoprops, :pseudocolumns]
  end
  def(meta(:values)) do
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22]
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
  def(member?(_)) do
    false
  end
  def(name?(:catalogs)) do
    true
  end
  def(name?(:schemas)) do
    true
  end
  def(name?(:tables)) do
    true
  end
  def(name?(:tabletypes)) do
    true
  end
  def(name?(:columns)) do
    true
  end
  def(name?(:tableprivileges)) do
    true
  end
  def(name?(:columnprivileges)) do
    true
  end
  def(name?(:primarykeys)) do
    true
  end
  def(name?(:importedkeys)) do
    true
  end
  def(name?(:exportedkeys)) do
    true
  end
  def(name?(:crossreference)) do
    true
  end
  def(name?(:procedures)) do
    true
  end
  def(name?(:functions)) do
    true
  end
  def(name?(:procedurecolumns)) do
    true
  end
  def(name?(:functioncolumns)) do
    true
  end
  def(name?(:attributes)) do
    true
  end
  def(name?(:typeinfo)) do
    true
  end
  def(name?(:supertypes)) do
    true
  end
  def(name?(:supertables)) do
    true
  end
  def(name?(:versioncolumns)) do
    true
  end
  def(name?(:clientinfoprops)) do
    true
  end
  def(name?(:pseudocolumns)) do
    true
  end
  def(name?(_)) do
    false
  end
end