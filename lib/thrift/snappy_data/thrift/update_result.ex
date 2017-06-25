defmodule(SnappyData.Thrift.UpdateResult) do
  _ = "Auto-generated Thrift struct snappydata.UpdateResult"
  _ = "1: i32 update_count"
  _ = "2: list<i32> batch_update_counts"
  _ = "3: snappydata.RowSet generated_keys"
  _ = "4: string new_default_schema"
  _ = "5: snappydata.SnappyExceptionData warnings"
  defstruct(update_count: nil, batch_update_counts: nil, generated_keys: nil, new_default_schema: nil, warnings: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %SnappyData.Thrift.UpdateResult{})
    end
    defp(deserialize(<<0, rest::binary>>, %SnappyData.Thrift.UpdateResult{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<8, 1::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | update_count: value})
    end
    defp(deserialize(<<15, 2::16-signed, 8, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__batch_update_counts(rest, [[], remaining, struct])
    end
    defp(deserialize(<<12, 3::16-signed, rest::binary>>, acc)) do
      case(Elixir.SnappyData.Thrift.RowSet.BinaryProtocol.deserialize(rest)) do
        {value, rest} ->
          deserialize(rest, %{acc | generated_keys: value})
        :error ->
          :error
      end
    end
    defp(deserialize(<<11, 4::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | new_default_schema: value})
    end
    defp(deserialize(<<12, 5::16-signed, rest::binary>>, acc)) do
      case(Elixir.SnappyData.Thrift.SnappyExceptionData.BinaryProtocol.deserialize(rest)) do
        {value, rest} ->
          deserialize(rest, %{acc | warnings: value})
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
    defp(deserialize__batch_update_counts(<<element::32-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__batch_update_counts(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__batch_update_counts(_, _)) do
      :error
    end
    def(serialize(%SnappyData.Thrift.UpdateResult{update_count: update_count, batch_update_counts: batch_update_counts, generated_keys: generated_keys, new_default_schema: new_default_schema, warnings: warnings})) do
      [case(update_count) do
        nil ->
          <<>>
        _ ->
          <<8, 1::16-signed, update_count::32-signed>>
      end, case(batch_update_counts) do
        nil ->
          <<>>
        _ ->
          [<<15, 2::16-signed, 8, length(batch_update_counts)::32-signed>> | for(e <- batch_update_counts) do
            <<e::32-signed>>
          end]
      end, case(generated_keys) do
        nil ->
          <<>>
        _ ->
          [<<12, 3::16-signed>> | SnappyData.Thrift.RowSet.serialize(generated_keys)]
      end, case(new_default_schema) do
        nil ->
          <<>>
        _ ->
          [<<11, 4::16-signed, byte_size(new_default_schema)::32-signed>> | new_default_schema]
      end, case(warnings) do
        nil ->
          <<>>
        _ ->
          [<<12, 5::16-signed>> | SnappyData.Thrift.SnappyExceptionData.serialize(warnings)]
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