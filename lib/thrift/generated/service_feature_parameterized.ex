defmodule Thrift.Generated.ServiceFeatureParameterized do
  @moduledoc "Auto-generated Thrift enum snappydata.ServiceFeatureParameterized"
  defmacro unquote(:transactions_support_isolation)() do
    1
  end

  defmacro unquote(:resultset_type)() do
    2
  end

  defmacro unquote(:resultset_concurrency_read_only)() do
    3
  end

  defmacro unquote(:resultset_concurrency_updatable)() do
    4
  end

  defmacro unquote(:resultset_own_updates_visible)() do
    5
  end

  defmacro unquote(:resultset_own_deletes_visible)() do
    6
  end

  defmacro unquote(:resultset_own_inserts_visible)() do
    7
  end

  defmacro unquote(:resultset_others_updates_visible)() do
    8
  end

  defmacro unquote(:resultset_others_deletes_visible)() do
    9
  end

  defmacro unquote(:resultset_others_inserts_visible)() do
    10
  end

  defmacro unquote(:resultset_updates_detected)() do
    11
  end

  defmacro unquote(:resultset_deletes_detected)() do
    12
  end

  defmacro unquote(:resultset_inserts_detected)() do
    13
  end

  def value_to_name(1) do
    {:ok, :transactions_support_isolation}
  end

  def value_to_name(2) do
    {:ok, :resultset_type}
  end

  def value_to_name(3) do
    {:ok, :resultset_concurrency_read_only}
  end

  def value_to_name(4) do
    {:ok, :resultset_concurrency_updatable}
  end

  def value_to_name(5) do
    {:ok, :resultset_own_updates_visible}
  end

  def value_to_name(6) do
    {:ok, :resultset_own_deletes_visible}
  end

  def value_to_name(7) do
    {:ok, :resultset_own_inserts_visible}
  end

  def value_to_name(8) do
    {:ok, :resultset_others_updates_visible}
  end

  def value_to_name(9) do
    {:ok, :resultset_others_deletes_visible}
  end

  def value_to_name(10) do
    {:ok, :resultset_others_inserts_visible}
  end

  def value_to_name(11) do
    {:ok, :resultset_updates_detected}
  end

  def value_to_name(12) do
    {:ok, :resultset_deletes_detected}
  end

  def value_to_name(13) do
    {:ok, :resultset_inserts_detected}
  end

  def value_to_name(v) do
    {:error, {:invalid_enum_value, v}}
  end

  def name_to_value(:transactions_support_isolation) do
    {:ok, 1}
  end

  def name_to_value(:resultset_type) do
    {:ok, 2}
  end

  def name_to_value(:resultset_concurrency_read_only) do
    {:ok, 3}
  end

  def name_to_value(:resultset_concurrency_updatable) do
    {:ok, 4}
  end

  def name_to_value(:resultset_own_updates_visible) do
    {:ok, 5}
  end

  def name_to_value(:resultset_own_deletes_visible) do
    {:ok, 6}
  end

  def name_to_value(:resultset_own_inserts_visible) do
    {:ok, 7}
  end

  def name_to_value(:resultset_others_updates_visible) do
    {:ok, 8}
  end

  def name_to_value(:resultset_others_deletes_visible) do
    {:ok, 9}
  end

  def name_to_value(:resultset_others_inserts_visible) do
    {:ok, 10}
  end

  def name_to_value(:resultset_updates_detected) do
    {:ok, 11}
  end

  def name_to_value(:resultset_deletes_detected) do
    {:ok, 12}
  end

  def name_to_value(:resultset_inserts_detected) do
    {:ok, 13}
  end

  def name_to_value(k) do
    {:error, {:invalid_enum_name, k}}
  end

  def value_to_name!(value) do
    {:ok, name} = value_to_name(value)
    name
  end

  def name_to_value!(name) do
    {:ok, value} = name_to_value(name)
    value
  end

  def meta(:names) do
    [
      :transactions_support_isolation,
      :resultset_type,
      :resultset_concurrency_read_only,
      :resultset_concurrency_updatable,
      :resultset_own_updates_visible,
      :resultset_own_deletes_visible,
      :resultset_own_inserts_visible,
      :resultset_others_updates_visible,
      :resultset_others_deletes_visible,
      :resultset_others_inserts_visible,
      :resultset_updates_detected,
      :resultset_deletes_detected,
      :resultset_inserts_detected
    ]
  end

  def meta(:values) do
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
  end

  def member?(1) do
    true
  end

  def member?(2) do
    true
  end

  def member?(3) do
    true
  end

  def member?(4) do
    true
  end

  def member?(5) do
    true
  end

  def member?(6) do
    true
  end

  def member?(7) do
    true
  end

  def member?(8) do
    true
  end

  def member?(9) do
    true
  end

  def member?(10) do
    true
  end

  def member?(11) do
    true
  end

  def member?(12) do
    true
  end

  def member?(13) do
    true
  end

  def member?(_) do
    false
  end

  def name?(:transactions_support_isolation) do
    true
  end

  def name?(:resultset_type) do
    true
  end

  def name?(:resultset_concurrency_read_only) do
    true
  end

  def name?(:resultset_concurrency_updatable) do
    true
  end

  def name?(:resultset_own_updates_visible) do
    true
  end

  def name?(:resultset_own_deletes_visible) do
    true
  end

  def name?(:resultset_own_inserts_visible) do
    true
  end

  def name?(:resultset_others_updates_visible) do
    true
  end

  def name?(:resultset_others_deletes_visible) do
    true
  end

  def name?(:resultset_others_inserts_visible) do
    true
  end

  def name?(:resultset_updates_detected) do
    true
  end

  def name?(:resultset_deletes_detected) do
    true
  end

  def name?(:resultset_inserts_detected) do
    true
  end

  def name?(_) do
    false
  end
end
