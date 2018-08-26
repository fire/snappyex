defmodule(Thrift.Generated.SecurityMechanism) do
  @moduledoc("Auto-generated Thrift enum snappydata.SecurityMechanism")
  defmacro(unquote(:plain)()) do
    1
  end
  defmacro(unquote(:diffie_hellman)()) do
    2
  end
  def(value_to_name(1)) do
    {:ok, :plain}
  end
  def(value_to_name(2)) do
    {:ok, :diffie_hellman}
  end
  def(value_to_name(v)) do
    {:error, {:invalid_enum_value, v}}
  end
  def(name_to_value(:plain)) do
    {:ok, 1}
  end
  def(name_to_value(:diffie_hellman)) do
    {:ok, 2}
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
    [:plain, :diffie_hellman]
  end
  def(meta(:values)) do
    [1, 2]
  end
  def(member?(1)) do
    true
  end
  def(member?(2)) do
    true
  end
  def(member?(_)) do
    false
  end
  def(name?(:plain)) do
    true
  end
  def(name?(:diffie_hellman)) do
    true
  end
  def(name?(_)) do
    false
  end
end