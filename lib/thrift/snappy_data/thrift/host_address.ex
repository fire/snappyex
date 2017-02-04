defmodule(SnappyData.Thrift.HostAddress) do
  _ = "Auto-generated Thrift struct snappydata.HostAddress"
  _ = "1: string host_name"
  _ = "2: i32 port"
  _ = "3: string ip_address"
  _ = "4: snappydata.ServerType server_type"
  defstruct(host_name: nil, port: nil, ip_address: nil, server_type: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    def(deserialize(binary)) do
      deserialize(binary, %SnappyData.Thrift.HostAddress{})
    end
    defp(deserialize(<<0, rest::binary>>, %SnappyData.Thrift.HostAddress{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<11, 1::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | host_name: value})
    end
    defp(deserialize(<<8, 2::16-signed, value::size(32), rest::binary>>, acc)) do
      deserialize(rest, %{acc | port: value})
    end
    defp(deserialize(<<11, 3::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | ip_address: value})
    end
    defp(deserialize(<<8, 4::16-signed, value::size(32), rest::binary>>, acc)) do
      deserialize(rest, %{acc | server_type: value})
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    def(serialize(%SnappyData.Thrift.HostAddress{host_name: host_name, port: port, ip_address: ip_address, server_type: server_type})) do
      [case(host_name) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :host_name on SnappyData.Thrift.HostAddress must not be nil")
        _ ->
          [<<11, 1::size(16), byte_size(host_name)::size(32)>> | host_name]
      end, case(port) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :port on SnappyData.Thrift.HostAddress must not be nil")
        _ ->
          <<8, 2::size(16), port::32-signed>>
      end, case(ip_address) do
        nil ->
          <<>>
        _ ->
          [<<11, 3::size(16), byte_size(ip_address)::size(32)>> | ip_address]
      end, case(server_type) do
        nil ->
          <<>>
        _ ->
          <<8, 4::size(16), server_type::32-signed>>
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