defmodule(SnappyData.Thrift.ClobChunk) do
  _ = "Auto-generated Thrift struct snappydata.ClobChunk"
  _ = "1: string chunk"
  _ = "2: bool last"
  _ = "3: i64 lob_id"
  _ = "4: i64 offset"
  _ = "5: i64 total_length"
  defstruct(chunk: nil, last: nil, lob_id: nil, offset: nil, total_length: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %SnappyData.Thrift.ClobChunk{})
    end
    defp(deserialize(<<0, rest::binary>>, %SnappyData.Thrift.ClobChunk{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<11, 1::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | chunk: value})
    end
    defp(deserialize(<<2, 2::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | last: true})
    end
    defp(deserialize(<<2, 2::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | last: false})
    end
    defp(deserialize(<<10, 3::16-signed, value::64-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | lob_id: value})
    end
    defp(deserialize(<<10, 4::16-signed, value::64-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | offset: value})
    end
    defp(deserialize(<<10, 5::16-signed, value::64-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | total_length: value})
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    def(serialize(%SnappyData.Thrift.ClobChunk{chunk: chunk, last: last, lob_id: lob_id, offset: offset, total_length: total_length})) do
      [case(chunk) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :chunk on SnappyData.Thrift.ClobChunk must not be nil")
        _ ->
          [<<11, 1::16-signed, byte_size(chunk)::32-signed>> | chunk]
      end, case(last) do
        false ->
          <<2, 2::16-signed, 0>>
        true ->
          <<2, 2::16-signed, 1>>
        _ ->
          raise(Thrift.InvalidValueException, "Required boolean field :last on SnappyData.Thrift.ClobChunk must be true or false")
      end, case(lob_id) do
        nil ->
          <<>>
        _ ->
          <<10, 3::16-signed, lob_id::64-signed>>
      end, case(offset) do
        nil ->
          <<>>
        _ ->
          <<10, 4::16-signed, offset::64-signed>>
      end, case(total_length) do
        nil ->
          <<>>
        _ ->
          <<10, 5::16-signed, total_length::64-signed>>
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