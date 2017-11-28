defmodule(Thrift.Generated.HostAddress) do
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
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %Thrift.Generated.HostAddress{})
    end
    defp(deserialize(<<0, rest::binary>>, %Thrift.Generated.HostAddress{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<11, 1::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | host_name: value})
    end
    defp(deserialize(<<8, 2::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | port: value})
    end
    defp(deserialize(<<11, 3::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | ip_address: value})
    end
    defp(deserialize(<<8, 4::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | server_type: value})
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    def(serialize(%Thrift.Generated.HostAddress{host_name: host_name, port: port, ip_address: ip_address, server_type: server_type})) do
      [case(host_name) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :host_name on Thrift.Generated.HostAddress must not be nil")
        _ ->
          [<<11, 1::16-signed, byte_size(host_name)::32-signed>> | host_name]
      end, case(port) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :port on Thrift.Generated.HostAddress must not be nil")
        _ ->
          <<8, 2::16-signed, port::32-signed>>
      end, case(ip_address) do
        nil ->
          <<>>
        _ ->
          [<<11, 3::16-signed, byte_size(ip_address)::32-signed>> | ip_address]
      end, case(server_type) do
        nil ->
          <<>>
        _ ->
          <<8, 4::16-signed, server_type::32-signed>>
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