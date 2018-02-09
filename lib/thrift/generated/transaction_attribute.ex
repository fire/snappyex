defmodule Thrift.Generated.TransactionAttribute do
  @moduledoc "Auto-generated Thrift enum snappydata.TransactionAttribute"
  defmacro unquote(:autocommit)() do
    1
  end

  defmacro unquote(:read_only_connection)() do
    2
  end

  defmacro unquote(:waiting_mode)() do
    3
  end

  defmacro unquote(:disable_batching)() do
    4
  end

  defmacro unquote(:sync_commits)() do
    5
  end

  def value_to_name(1) do
    {:ok, :autocommit}
  end

  def value_to_name(2) do
    {:ok, :read_only_connection}
  end

  def value_to_name(3) do
    {:ok, :waiting_mode}
  end

  def value_to_name(4) do
    {:ok, :disable_batching}
  end

  def value_to_name(5) do
    {:ok, :sync_commits}
  end

  def value_to_name(v) do
    {:error, {:invalid_enum_value, v}}
  end

  def name_to_value(:autocommit) do
    {:ok, 1}
  end

  def name_to_value(:read_only_connection) do
    {:ok, 2}
  end

  def name_to_value(:waiting_mode) do
    {:ok, 3}
  end

  def name_to_value(:disable_batching) do
    {:ok, 4}
  end

  def name_to_value(:sync_commits) do
    {:ok, 5}
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
    [:autocommit, :read_only_connection, :waiting_mode, :disable_batching, :sync_commits]
  end

  def meta(:values) do
    [1, 2, 3, 4, 5]
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

  def member?(_) do
    false
  end

  def name?(:autocommit) do
    true
  end

  def name?(:read_only_connection) do
    true
  end

  def name?(:waiting_mode) do
    true
  end

  def name?(:disable_batching) do
    true
  end

  def name?(:sync_commits) do
    true
  end

  def name?(_) do
    false
  end
end
