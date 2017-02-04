defmodule(SnappyData.Thrift.StatementResult) do
  _ = "Auto-generated Thrift struct snappydata.StatementResult"
  _ = "1: snappydata.RowSet result_set"
  _ = "2: i32 update_count"
  _ = "3: list<i32> batch_update_counts"
  _ = "4: map<i32,snappydata.ColumnValue> procedure_out_params"
  _ = "5: snappydata.RowSet generated_keys"
  _ = "6: string new_default_schema"
  _ = "7: snappydata.SnappyExceptionData warnings"
  _ = "8: snappydata.PrepareResult prepared_result"
  defstruct(result_set: nil, update_count: nil, batch_update_counts: nil, procedure_out_params: nil, generated_keys: nil, new_default_schema: nil, warnings: nil, prepared_result: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    def(deserialize(binary)) do
      deserialize(binary, %SnappyData.Thrift.StatementResult{})
    end
    defp(deserialize(<<0, rest::binary>>, %SnappyData.Thrift.StatementResult{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
      case(Elixir.SnappyData.Thrift.RowSet.BinaryProtocol.deserialize(rest)) do
        {value, rest} ->
          deserialize(rest, %{acc | result_set: value})
        :error ->
          :error
      end
    end
    defp(deserialize(<<8, 2::16-signed, value::size(32), rest::binary>>, acc)) do
      deserialize(rest, %{acc | update_count: value})
    end
    defp(deserialize(<<15, 3::16-signed, 8, remaining::size(32), rest::binary>>, struct)) do
      deserialize__batch_update_counts(rest, [[], remaining, struct])
    end
    defp(deserialize(<<13, 4::16-signed, 8, 12, map_size::size(32), rest::binary>>, struct)) do
      deserialize__procedure_out_params__key(rest, [%{}, map_size, struct])
    end
    defp(deserialize(<<12, 5::16-signed, rest::binary>>, acc)) do
      case(Elixir.SnappyData.Thrift.RowSet.BinaryProtocol.deserialize(rest)) do
        {value, rest} ->
          deserialize(rest, %{acc | generated_keys: value})
        :error ->
          :error
      end
    end
    defp(deserialize(<<11, 6::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | new_default_schema: value})
    end
    defp(deserialize(<<12, 7::16-signed, rest::binary>>, acc)) do
      case(Elixir.SnappyData.Thrift.SnappyExceptionData.BinaryProtocol.deserialize(rest)) do
        {value, rest} ->
          deserialize(rest, %{acc | warnings: value})
        :error ->
          :error
      end
    end
    defp(deserialize(<<12, 8::16-signed, rest::binary>>, acc)) do
      case(Elixir.SnappyData.Thrift.PrepareResult.BinaryProtocol.deserialize(rest)) do
        {value, rest} ->
          deserialize(rest, %{acc | prepared_result: value})
        :error ->
          :error
      end
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    defp(deserialize__batch_update_counts(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | batch_update_counts: Enum.reverse(list)})
    end
    defp(deserialize__batch_update_counts(<<element::size(32), rest::binary>>, [list, remaining | stack])) do
      deserialize__batch_update_counts(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__batch_update_counts(_, _)) do
      :error
    end
    defp(deserialize__procedure_out_params__key(<<rest::binary>>, [map, 0, struct])) do
      deserialize(rest, %{struct | procedure_out_params: map})
    end
    defp(deserialize__procedure_out_params__key(<<key::size(32), rest::binary>>, stack)) do
      deserialize__procedure_out_params__value(rest, key, stack)
    end
    defp(deserialize__procedure_out_params__key(_, _)) do
      :error
    end
    defp(deserialize__procedure_out_params__value(<<rest::binary>>, key, [map, remaining | stack])) do
      case(Elixir.SnappyData.Thrift.ColumnValue.BinaryProtocol.deserialize(rest)) do
        {value, rest} ->
          deserialize__procedure_out_params__key(rest, [Map.put(map, key, value), remaining - 1 | stack])
        :error ->
          :error
      end
    end
    defp(deserialize__procedure_out_params__value(_, _, _)) do
      :error
    end
    def(serialize(%SnappyData.Thrift.StatementResult{result_set: result_set, update_count: update_count, batch_update_counts: batch_update_counts, procedure_out_params: procedure_out_params, generated_keys: generated_keys, new_default_schema: new_default_schema, warnings: warnings, prepared_result: prepared_result})) do
      [case(result_set) do
        nil ->
          <<>>
        _ ->
          [<<12, 1::size(16)>> | SnappyData.Thrift.RowSet.serialize(result_set)]
      end, case(update_count) do
        nil ->
          <<>>
        _ ->
          <<8, 2::size(16), update_count::32-signed>>
      end, case(batch_update_counts) do
        nil ->
          <<>>
        _ ->
          [<<15, 3::size(16), 8, length(batch_update_counts)::size(32)>> | for(e <- batch_update_counts) do
            <<e::32-signed>>
          end]
      end, case(procedure_out_params) do
        nil ->
          <<>>
        _ ->
          [<<13, 4::size(16), 8, 12, Enum.count(procedure_out_params)::size(32)>> | for({k, v} <- procedure_out_params) do
            [<<k::32-signed>> | SnappyData.Thrift.ColumnValue.serialize(v)]
          end]
      end, case(generated_keys) do
        nil ->
          <<>>
        _ ->
          [<<12, 5::size(16)>> | SnappyData.Thrift.RowSet.serialize(generated_keys)]
      end, case(new_default_schema) do
        nil ->
          <<>>
        _ ->
          [<<11, 6::size(16), byte_size(new_default_schema)::size(32)>> | new_default_schema]
      end, case(warnings) do
        nil ->
          <<>>
        _ ->
          [<<12, 7::size(16)>> | SnappyData.Thrift.SnappyExceptionData.serialize(warnings)]
      end, case(prepared_result) do
        nil ->
          <<>>
        _ ->
          [<<12, 8::size(16)>> | SnappyData.Thrift.PrepareResult.serialize(prepared_result)]
      end | <<0>>]
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