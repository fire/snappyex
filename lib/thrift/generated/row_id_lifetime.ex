defmodule(Thrift.Generated.RowIdLifetime) do
  @moduledoc("Auto-generated Thrift enum snappydata.RowIdLifetime")
  defmacro(unquote(:rowid_unsupported)()) do
    1
  end
  defmacro(unquote(:rowid_valid_other)()) do
    2
  end
  defmacro(unquote(:rowid_valid_session)()) do
    3
  end
  defmacro(unquote(:rowid_valid_transaction)()) do
    4
  end
  defmacro(unquote(:rowid_valid_forever)()) do
    5
  end
  def(value_to_name(1)) do
    {:ok, :rowid_unsupported}
  end
  def(value_to_name(2)) do
    {:ok, :rowid_valid_other}
  end
  def(value_to_name(3)) do
    {:ok, :rowid_valid_session}
  end
  def(value_to_name(4)) do
    {:ok, :rowid_valid_transaction}
  end
  def(value_to_name(5)) do
    {:ok, :rowid_valid_forever}
  end
  def(value_to_name(v)) do
    {:error, {:invalid_enum_value, v}}
  end
  def(name_to_value(:rowid_unsupported)) do
    {:ok, 1}
  end
  def(name_to_value(:rowid_valid_other)) do
    {:ok, 2}
  end
  def(name_to_value(:rowid_valid_session)) do
    {:ok, 3}
  end
  def(name_to_value(:rowid_valid_transaction)) do
    {:ok, 4}
  end
  def(name_to_value(:rowid_valid_forever)) do
    {:ok, 5}
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
    [:rowid_unsupported, :rowid_valid_other, :rowid_valid_session, :rowid_valid_transaction, :rowid_valid_forever]
  end
  def(meta(:values)) do
    [1, 2, 3, 4, 5]
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
  def(member?(_)) do
    false
  end
  def(name?(:rowid_unsupported)) do
    true
  end
  def(name?(:rowid_valid_other)) do
    true
  end
  def(name?(:rowid_valid_session)) do
    true
  end
  def(name?(:rowid_valid_transaction)) do
    true
  end
  def(name?(:rowid_valid_forever)) do
    true
  end
  def(name?(_)) do
    false
  end
end