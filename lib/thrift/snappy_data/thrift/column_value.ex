defmodule(SnappyData.Thrift.ColumnValue) do
  _ = "Auto-generated Thrift union snappydata.ColumnValue"
  _ = "1: bool bool_val"
  _ = "2: i8 byte_val"
  _ = "3: i16 i16_val"
  _ = "4: i32 i32_val"
  _ = "5: i64 i64_val"
  _ = "6: i32 float_val"
  _ = "7: double double_val"
  _ = "8: string string_val"
  _ = "9: snappydata.Decimal decimal_val"
  _ = "10: i64 date_val"
  _ = "11: i64 time_val"
  _ = "12: i64 timestamp_val"
  _ = "13: binary binary_val"
  _ = "14: snappydata.BlobChunk blob_val"
  _ = "15: snappydata.ClobChunk clob_val"
  _ = "16: list<snappydata.ColumnValue> array_val"
  _ = "17: map<snappydata.ColumnValue,snappydata.ColumnValue> map_val"
  _ = "18: list<snappydata.ColumnValue> struct_val"
  _ = "19: bool null_val"
  _ = "20: binary java_val"
  defstruct(bool_val: nil, byte_val: nil, i16_val: nil, i32_val: nil, i64_val: nil, float_val: nil, double_val: nil, string_val: nil, decimal_val: nil, date_val: nil, time_val: nil, timestamp_val: nil, binary_val: nil, blob_val: nil, clob_val: nil, array_val: nil, map_val: nil, struct_val: nil, null_val: nil, java_val: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %SnappyData.Thrift.ColumnValue{})
    end
    defp(deserialize(<<0, rest::binary>>, %SnappyData.Thrift.ColumnValue{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<2, 1::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | bool_val: true})
    end
    defp(deserialize(<<2, 1::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | bool_val: false})
    end
    defp(deserialize(<<3, 2::16-signed, value::8-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | byte_val: value})
    end
    defp(deserialize(<<6, 3::16-signed, value::16-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | i16_val: value})
    end
    defp(deserialize(<<8, 4::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | i32_val: value})
    end
    defp(deserialize(<<10, 5::16-signed, value::64-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | i64_val: value})
    end
    defp(deserialize(<<8, 6::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | float_val: value})
    end
    defp(deserialize(<<4, 7::16-signed, value::float-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | double_val: value})
    end
    defp(deserialize(<<11, 8::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | string_val: value})
    end
    defp(deserialize(<<12, 9::16-signed, rest::binary>>, acc)) do
      case(Elixir.SnappyData.Thrift.Decimal.BinaryProtocol.deserialize(rest)) do
        {value, rest} ->
          deserialize(rest, %{acc | decimal_val: value})
        :error ->
          :error
      end
    end
    defp(deserialize(<<10, 10::16-signed, value::64-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | date_val: value})
    end
    defp(deserialize(<<10, 11::16-signed, value::64-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | time_val: value})
    end
    defp(deserialize(<<10, 12::16-signed, value::64-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | timestamp_val: value})
    end
    defp(deserialize(<<11, 13::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | binary_val: value})
    end
    defp(deserialize(<<12, 14::16-signed, rest::binary>>, acc)) do
      case(Elixir.SnappyData.Thrift.BlobChunk.BinaryProtocol.deserialize(rest)) do
        {value, rest} ->
          deserialize(rest, %{acc | blob_val: value})
        :error ->
          :error
      end
    end
    defp(deserialize(<<12, 15::16-signed, rest::binary>>, acc)) do
      case(Elixir.SnappyData.Thrift.ClobChunk.BinaryProtocol.deserialize(rest)) do
        {value, rest} ->
          deserialize(rest, %{acc | clob_val: value})
        :error ->
          :error
      end
    end
    defp(deserialize(<<15, 16::16-signed, 12, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__array_val(rest, [[], remaining, struct])
    end
    defp(deserialize(<<13, 17::16-signed, 12, 12, map_size::32-signed, rest::binary>>, struct)) do
      deserialize__map_val__key(rest, [%{}, map_size, struct])
    end
    defp(deserialize(<<15, 18::16-signed, 12, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__struct_val(rest, [[], remaining, struct])
    end
    defp(deserialize(<<2, 19::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | null_val: true})
    end
    defp(deserialize(<<2, 19::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | null_val: false})
    end
    defp(deserialize(<<11, 20::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | java_val: value})
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    defp(deserialize__array_val(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | array_val: Enum.reverse(list)})
    end
    defp(deserialize__array_val(<<rest::binary>>, [list, remaining | stack])) do
      case(Elixir.SnappyData.Thrift.ColumnValue.BinaryProtocol.deserialize(rest)) do
        {element, rest} ->
          deserialize__array_val(rest, [[element | list], remaining - 1 | stack])
        :error ->
          :error
      end
    end
    defp(deserialize__array_val(_, _)) do
      :error
    end
    defp(deserialize__map_val__key(<<rest::binary>>, [map, 0, struct])) do
      deserialize(rest, %{struct | map_val: map})
    end
    defp(deserialize__map_val__key(<<rest::binary>>, stack)) do
      case(Elixir.SnappyData.Thrift.ColumnValue.BinaryProtocol.deserialize(rest)) do
        {key, rest} ->
          deserialize__map_val__value(rest, key, stack)
        :error ->
          :error
      end
    end
    defp(deserialize__map_val__key(_, _)) do
      :error
    end
    defp(deserialize__map_val__value(<<rest::binary>>, key, [map, remaining | stack])) do
      case(Elixir.SnappyData.Thrift.ColumnValue.BinaryProtocol.deserialize(rest)) do
        {value, rest} ->
          deserialize__map_val__key(rest, [Map.put(map, key, value), remaining - 1 | stack])
        :error ->
          :error
      end
    end
    defp(deserialize__map_val__value(_, _, _)) do
      :error
    end
    defp(deserialize__struct_val(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | struct_val: Enum.reverse(list)})
    end
    defp(deserialize__struct_val(<<rest::binary>>, [list, remaining | stack])) do
      case(Elixir.SnappyData.Thrift.ColumnValue.BinaryProtocol.deserialize(rest)) do
        {element, rest} ->
          deserialize__struct_val(rest, [[element | list], remaining - 1 | stack])
        :error ->
          :error
      end
    end
    defp(deserialize__struct_val(_, _)) do
      :error
    end
    def(serialize(%SnappyData.Thrift.ColumnValue{bool_val: nil, byte_val: nil, i16_val: nil, i32_val: nil, i64_val: nil, float_val: nil, double_val: nil, string_val: nil, decimal_val: nil, date_val: nil, time_val: nil, timestamp_val: nil, binary_val: nil, blob_val: nil, clob_val: nil, array_val: nil, map_val: nil, struct_val: nil, null_val: nil, java_val: nil})) do
      <<0>>
    end
    def(serialize(%SnappyData.Thrift.ColumnValue{bool_val: bool_val, byte_val: nil, i16_val: nil, i32_val: nil, i64_val: nil, float_val: nil, double_val: nil, string_val: nil, decimal_val: nil, date_val: nil, time_val: nil, timestamp_val: nil, binary_val: nil, blob_val: nil, clob_val: nil, array_val: nil, map_val: nil, struct_val: nil, null_val: nil, java_val: nil})) do
      [<<2, 1::16-signed>>, case(bool_val) do
        nil ->
          <<0>>
        false ->
          <<0>>
        _ ->
          <<1>>
      end | <<0>>]
    end
    def(serialize(%SnappyData.Thrift.ColumnValue{bool_val: nil, byte_val: byte_val, i16_val: nil, i32_val: nil, i64_val: nil, float_val: nil, double_val: nil, string_val: nil, decimal_val: nil, date_val: nil, time_val: nil, timestamp_val: nil, binary_val: nil, blob_val: nil, clob_val: nil, array_val: nil, map_val: nil, struct_val: nil, null_val: nil, java_val: nil})) do
      <<3, 2::16-signed, byte_val::8-signed, (<<0>>)>>
    end
    def(serialize(%SnappyData.Thrift.ColumnValue{bool_val: nil, byte_val: nil, i16_val: i16_val, i32_val: nil, i64_val: nil, float_val: nil, double_val: nil, string_val: nil, decimal_val: nil, date_val: nil, time_val: nil, timestamp_val: nil, binary_val: nil, blob_val: nil, clob_val: nil, array_val: nil, map_val: nil, struct_val: nil, null_val: nil, java_val: nil})) do
      <<6, 3::16-signed, i16_val::16-signed, (<<0>>)>>
    end
    def(serialize(%SnappyData.Thrift.ColumnValue{bool_val: nil, byte_val: nil, i16_val: nil, i32_val: i32_val, i64_val: nil, float_val: nil, double_val: nil, string_val: nil, decimal_val: nil, date_val: nil, time_val: nil, timestamp_val: nil, binary_val: nil, blob_val: nil, clob_val: nil, array_val: nil, map_val: nil, struct_val: nil, null_val: nil, java_val: nil})) do
      <<8, 4::16-signed, i32_val::32-signed, (<<0>>)>>
    end
    def(serialize(%SnappyData.Thrift.ColumnValue{bool_val: nil, byte_val: nil, i16_val: nil, i32_val: nil, i64_val: i64_val, float_val: nil, double_val: nil, string_val: nil, decimal_val: nil, date_val: nil, time_val: nil, timestamp_val: nil, binary_val: nil, blob_val: nil, clob_val: nil, array_val: nil, map_val: nil, struct_val: nil, null_val: nil, java_val: nil})) do
      <<10, 5::16-signed, i64_val::64-signed, (<<0>>)>>
    end
    def(serialize(%SnappyData.Thrift.ColumnValue{bool_val: nil, byte_val: nil, i16_val: nil, i32_val: nil, i64_val: nil, float_val: float_val, double_val: nil, string_val: nil, decimal_val: nil, date_val: nil, time_val: nil, timestamp_val: nil, binary_val: nil, blob_val: nil, clob_val: nil, array_val: nil, map_val: nil, struct_val: nil, null_val: nil, java_val: nil})) do
      <<8, 6::16-signed, float_val::32-signed, (<<0>>)>>
    end
    def(serialize(%SnappyData.Thrift.ColumnValue{bool_val: nil, byte_val: nil, i16_val: nil, i32_val: nil, i64_val: nil, float_val: nil, double_val: double_val, string_val: nil, decimal_val: nil, date_val: nil, time_val: nil, timestamp_val: nil, binary_val: nil, blob_val: nil, clob_val: nil, array_val: nil, map_val: nil, struct_val: nil, null_val: nil, java_val: nil})) do
      <<4, 7::16-signed, double_val::float-signed, (<<0>>)>>
    end
    def(serialize(%SnappyData.Thrift.ColumnValue{bool_val: nil, byte_val: nil, i16_val: nil, i32_val: nil, i64_val: nil, float_val: nil, double_val: nil, string_val: string_val, decimal_val: nil, date_val: nil, time_val: nil, timestamp_val: nil, binary_val: nil, blob_val: nil, clob_val: nil, array_val: nil, map_val: nil, struct_val: nil, null_val: nil, java_val: nil})) do
      [<<11, 8::16-signed, byte_size(string_val)::32-signed>>, string_val | <<0>>]
    end
    def(serialize(%SnappyData.Thrift.ColumnValue{bool_val: nil, byte_val: nil, i16_val: nil, i32_val: nil, i64_val: nil, float_val: nil, double_val: nil, string_val: nil, decimal_val: decimal_val, date_val: nil, time_val: nil, timestamp_val: nil, binary_val: nil, blob_val: nil, clob_val: nil, array_val: nil, map_val: nil, struct_val: nil, null_val: nil, java_val: nil})) do
      [<<12, 9::16-signed>>, SnappyData.Thrift.Decimal.serialize(decimal_val) | <<0>>]
    end
    def(serialize(%SnappyData.Thrift.ColumnValue{bool_val: nil, byte_val: nil, i16_val: nil, i32_val: nil, i64_val: nil, float_val: nil, double_val: nil, string_val: nil, decimal_val: nil, date_val: date_val, time_val: nil, timestamp_val: nil, binary_val: nil, blob_val: nil, clob_val: nil, array_val: nil, map_val: nil, struct_val: nil, null_val: nil, java_val: nil})) do
      <<10, 10::16-signed, date_val::64-signed, (<<0>>)>>
    end
    def(serialize(%SnappyData.Thrift.ColumnValue{bool_val: nil, byte_val: nil, i16_val: nil, i32_val: nil, i64_val: nil, float_val: nil, double_val: nil, string_val: nil, decimal_val: nil, date_val: nil, time_val: time_val, timestamp_val: nil, binary_val: nil, blob_val: nil, clob_val: nil, array_val: nil, map_val: nil, struct_val: nil, null_val: nil, java_val: nil})) do
      <<10, 11::16-signed, time_val::64-signed, (<<0>>)>>
    end
    def(serialize(%SnappyData.Thrift.ColumnValue{bool_val: nil, byte_val: nil, i16_val: nil, i32_val: nil, i64_val: nil, float_val: nil, double_val: nil, string_val: nil, decimal_val: nil, date_val: nil, time_val: nil, timestamp_val: timestamp_val, binary_val: nil, blob_val: nil, clob_val: nil, array_val: nil, map_val: nil, struct_val: nil, null_val: nil, java_val: nil})) do
      <<10, 12::16-signed, timestamp_val::64-signed, (<<0>>)>>
    end
    def(serialize(%SnappyData.Thrift.ColumnValue{bool_val: nil, byte_val: nil, i16_val: nil, i32_val: nil, i64_val: nil, float_val: nil, double_val: nil, string_val: nil, decimal_val: nil, date_val: nil, time_val: nil, timestamp_val: nil, binary_val: binary_val, blob_val: nil, clob_val: nil, array_val: nil, map_val: nil, struct_val: nil, null_val: nil, java_val: nil})) do
      [<<11, 13::16-signed, byte_size(binary_val)::32-signed>>, binary_val | <<0>>]
    end
    def(serialize(%SnappyData.Thrift.ColumnValue{bool_val: nil, byte_val: nil, i16_val: nil, i32_val: nil, i64_val: nil, float_val: nil, double_val: nil, string_val: nil, decimal_val: nil, date_val: nil, time_val: nil, timestamp_val: nil, binary_val: nil, blob_val: blob_val, clob_val: nil, array_val: nil, map_val: nil, struct_val: nil, null_val: nil, java_val: nil})) do
      [<<12, 14::16-signed>>, SnappyData.Thrift.BlobChunk.serialize(blob_val) | <<0>>]
    end
    def(serialize(%SnappyData.Thrift.ColumnValue{bool_val: nil, byte_val: nil, i16_val: nil, i32_val: nil, i64_val: nil, float_val: nil, double_val: nil, string_val: nil, decimal_val: nil, date_val: nil, time_val: nil, timestamp_val: nil, binary_val: nil, blob_val: nil, clob_val: clob_val, array_val: nil, map_val: nil, struct_val: nil, null_val: nil, java_val: nil})) do
      [<<12, 15::16-signed>>, SnappyData.Thrift.ClobChunk.serialize(clob_val) | <<0>>]
    end
    def(serialize(%SnappyData.Thrift.ColumnValue{bool_val: nil, byte_val: nil, i16_val: nil, i32_val: nil, i64_val: nil, float_val: nil, double_val: nil, string_val: nil, decimal_val: nil, date_val: nil, time_val: nil, timestamp_val: nil, binary_val: nil, blob_val: nil, clob_val: nil, array_val: array_val, map_val: nil, struct_val: nil, null_val: nil, java_val: nil})) do
      [<<15, 16::16-signed, 12, length(array_val)::32-signed>>, for(e <- array_val) do
        SnappyData.Thrift.ColumnValue.serialize(e)
      end | <<0>>]
    end
    def(serialize(%SnappyData.Thrift.ColumnValue{bool_val: nil, byte_val: nil, i16_val: nil, i32_val: nil, i64_val: nil, float_val: nil, double_val: nil, string_val: nil, decimal_val: nil, date_val: nil, time_val: nil, timestamp_val: nil, binary_val: nil, blob_val: nil, clob_val: nil, array_val: nil, map_val: map_val, struct_val: nil, null_val: nil, java_val: nil})) do
      [<<13, 17::16-signed, 12, 12, Enum.count(map_val)::32-signed>>, for({k, v} <- map_val) do
        [SnappyData.Thrift.ColumnValue.serialize(k) | SnappyData.Thrift.ColumnValue.serialize(v)]
      end | <<0>>]
    end
    def(serialize(%SnappyData.Thrift.ColumnValue{bool_val: nil, byte_val: nil, i16_val: nil, i32_val: nil, i64_val: nil, float_val: nil, double_val: nil, string_val: nil, decimal_val: nil, date_val: nil, time_val: nil, timestamp_val: nil, binary_val: nil, blob_val: nil, clob_val: nil, array_val: nil, map_val: nil, struct_val: struct_val, null_val: nil, java_val: nil})) do
      [<<15, 18::16-signed, 12, length(struct_val)::32-signed>>, for(e <- struct_val) do
        SnappyData.Thrift.ColumnValue.serialize(e)
      end | <<0>>]
    end
    def(serialize(%SnappyData.Thrift.ColumnValue{bool_val: nil, byte_val: nil, i16_val: nil, i32_val: nil, i64_val: nil, float_val: nil, double_val: nil, string_val: nil, decimal_val: nil, date_val: nil, time_val: nil, timestamp_val: nil, binary_val: nil, blob_val: nil, clob_val: nil, array_val: nil, map_val: nil, struct_val: nil, null_val: null_val, java_val: nil})) do
      [<<2, 19::16-signed>>, case(null_val) do
        nil ->
          <<0>>
        false ->
          <<0>>
        _ ->
          <<1>>
      end | <<0>>]
    end
    def(serialize(%SnappyData.Thrift.ColumnValue{bool_val: nil, byte_val: nil, i16_val: nil, i32_val: nil, i64_val: nil, float_val: nil, double_val: nil, string_val: nil, decimal_val: nil, date_val: nil, time_val: nil, timestamp_val: nil, binary_val: nil, blob_val: nil, clob_val: nil, array_val: nil, map_val: nil, struct_val: nil, null_val: nil, java_val: java_val})) do
      [<<11, 20::16-signed, byte_size(java_val)::32-signed>>, java_val | <<0>>]
    end
    def(serialize(%SnappyData.Thrift.ColumnValue{} = value)) do
      set_fields = value |> Map.from_struct() |> Enum.flat_map(fn
        {_, nil} ->
          []
        {key, _} ->
          [key]
      end)
      raise(%Thrift.Union.TooManyFieldsSetException{message: "Thrift union has more than one field set", set_fields: set_fields})
    end
  end
  def(serialize(struct)) do
    BinaryProtocol.serialize(struct)
  end
  def(serialize(struct, :binary)) do
    BinaryProtocol.serialize(struct)
  end
  def(deserialize(binary)) do
    BinaryProtocol.deserialize(binary)
  end
end