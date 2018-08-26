defmodule(Thrift.Generated.CursorUpdateOperation) do
  @moduledoc("Auto-generated Thrift enum snappydata.CursorUpdateOperation")
  defmacro(unquote(:update_op)()) do
    1
  end
  defmacro(unquote(:insert_op)()) do
    2
  end
  defmacro(unquote(:delete_op)()) do
    3
  end
  def(value_to_name(1)) do
    {:ok, :update_op}
  end
  def(value_to_name(2)) do
    {:ok, :insert_op}
  end
  def(value_to_name(3)) do
    {:ok, :delete_op}
  end
  def(value_to_name(v)) do
    {:error, {:invalid_enum_value, v}}
  end
  def(name_to_value(:update_op)) do
    {:ok, 1}
  end
  def(name_to_value(:insert_op)) do
    {:ok, 2}
  end
  def(name_to_value(:delete_op)) do
    {:ok, 3}
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
    [:update_op, :insert_op, :delete_op]
  end
  def(meta(:values)) do
    [1, 2, 3]
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
  def(member?(_)) do
    false
  end
  def(name?(:update_op)) do
    true
  end
  def(name?(:insert_op)) do
    true
  end
  def(name?(:delete_op)) do
    true
  end
  def(name?(_)) do
    false
  end
end