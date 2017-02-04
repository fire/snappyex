defmodule(SnappyData.Thrift.Decimal) do
  _ = "Auto-generated Thrift struct snappydata.Decimal"
  _ = "1: i8 signum"
  _ = "2: i32 scale"
  _ = "3: binary magnitude"
  defstruct(signum: nil, scale: nil, magnitude: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    def(deserialize(binary)) do
      deserialize(binary, %SnappyData.Thrift.Decimal{})
    end
    defp(deserialize(<<0, rest::binary>>, %SnappyData.Thrift.Decimal{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<3, 1::16-signed, value, rest::binary>>, acc)) do
      deserialize(rest, %{acc | signum: value})
    end
    defp(deserialize(<<8, 2::16-signed, value::size(32), rest::binary>>, acc)) do
      deserialize(rest, %{acc | scale: value})
    end
    defp(deserialize(<<11, 3::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | magnitude: value})
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    def(serialize(%SnappyData.Thrift.Decimal{signum: signum, scale: scale, magnitude: magnitude})) do
      [case(signum) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :signum on SnappyData.Thrift.Decimal must not be nil")
        _ ->
          <<3, 1::size(16), signum::8-signed>>
      end, case(scale) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :scale on SnappyData.Thrift.Decimal must not be nil")
        _ ->
          <<8, 2::size(16), scale::32-signed>>
      end, case(magnitude) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :magnitude on SnappyData.Thrift.Decimal must not be nil")
        _ ->
          [<<11, 3::size(16), byte_size(magnitude)::size(32)>> | magnitude]
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