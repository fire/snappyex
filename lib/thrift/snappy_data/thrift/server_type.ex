defmodule(SnappyData.Thrift.ServerType) do
  @moduledoc("Auto-generated Thrift enum snappydata.ServerType")
  defmacro(unquote(:drda)()) do
    1
  end
  defmacro(unquote(:thrift_locator_cp)()) do
    2
  end
  defmacro(unquote(:thrift_locator_bp)()) do
    3
  end
  defmacro(unquote(:thrift_locator_cp_ssl)()) do
    4
  end
  defmacro(unquote(:thrift_locator_bp_ssl)()) do
    5
  end
  defmacro(unquote(:thrift_snappy_cp)()) do
    6
  end
  defmacro(unquote(:thrift_snappy_bp)()) do
    7
  end
  defmacro(unquote(:thrift_snappy_cp_ssl)()) do
    8
  end
  defmacro(unquote(:thrift_snappy_bp_ssl)()) do
    9
  end
  def(value_to_name(1)) do
    {:ok, :drda}
  end
  def(value_to_name(2)) do
    {:ok, :thrift_locator_cp}
  end
  def(value_to_name(3)) do
    {:ok, :thrift_locator_bp}
  end
  def(value_to_name(4)) do
    {:ok, :thrift_locator_cp_ssl}
  end
  def(value_to_name(5)) do
    {:ok, :thrift_locator_bp_ssl}
  end
  def(value_to_name(6)) do
    {:ok, :thrift_snappy_cp}
  end
  def(value_to_name(7)) do
    {:ok, :thrift_snappy_bp}
  end
  def(value_to_name(8)) do
    {:ok, :thrift_snappy_cp_ssl}
  end
  def(value_to_name(9)) do
    {:ok, :thrift_snappy_bp_ssl}
  end
  def(value_to_name(v)) do
    {:error, {:invalid_enum_value, v}}
  end
  def(name_to_value(:drda)) do
    {:ok, 1}
  end
  def(name_to_value(:thrift_locator_cp)) do
    {:ok, 2}
  end
  def(name_to_value(:thrift_locator_bp)) do
    {:ok, 3}
  end
  def(name_to_value(:thrift_locator_cp_ssl)) do
    {:ok, 4}
  end
  def(name_to_value(:thrift_locator_bp_ssl)) do
    {:ok, 5}
  end
  def(name_to_value(:thrift_snappy_cp)) do
    {:ok, 6}
  end
  def(name_to_value(:thrift_snappy_bp)) do
    {:ok, 7}
  end
  def(name_to_value(:thrift_snappy_cp_ssl)) do
    {:ok, 8}
  end
  def(name_to_value(:thrift_snappy_bp_ssl)) do
    {:ok, 9}
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
    [:drda, :thrift_locator_cp, :thrift_locator_bp, :thrift_locator_cp_ssl, :thrift_locator_bp_ssl, :thrift_snappy_cp, :thrift_snappy_bp, :thrift_snappy_cp_ssl, :thrift_snappy_bp_ssl]
  end
  def(meta(:values)) do
    [1, 2, 3, 4, 5, 6, 7, 8, 9]
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
  def(member?(_)) do
    false
  end
  def(name?(:drda)) do
    true
  end
  def(name?(:thrift_locator_cp)) do
    true
  end
  def(name?(:thrift_locator_bp)) do
    true
  end
  def(name?(:thrift_locator_cp_ssl)) do
    true
  end
  def(name?(:thrift_locator_bp_ssl)) do
    true
  end
  def(name?(:thrift_snappy_cp)) do
    true
  end
  def(name?(:thrift_snappy_bp)) do
    true
  end
  def(name?(:thrift_snappy_cp_ssl)) do
    true
  end
  def(name?(:thrift_snappy_bp_ssl)) do
    true
  end
  def(name?(_)) do
    false
  end
end