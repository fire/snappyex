defmodule(SnappyData.Thrift.OpenConnectionArgs) do
  _ = "Auto-generated Thrift struct snappydata.OpenConnectionArgs"
  _ = "1: string client_host_name"
  _ = "2: string client_id"
  _ = "3: snappydata.SecurityMechanism security"
  _ = "4: string user_name"
  _ = "5: string password"
  _ = "6: bool for_xa"
  _ = "7: i32 token_size"
  _ = "8: bool use_string_for_decimal"
  _ = "9: map<string,string> properties"
  defstruct(client_host_name: nil, client_id: nil, security: nil, user_name: nil, password: nil, for_xa: nil, token_size: nil, use_string_for_decimal: nil, properties: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    def(deserialize(binary)) do
      deserialize(binary, %SnappyData.Thrift.OpenConnectionArgs{})
    end
    defp(deserialize(<<0, rest::binary>>, %SnappyData.Thrift.OpenConnectionArgs{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<11, 1::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | client_host_name: value})
    end
    defp(deserialize(<<11, 2::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | client_id: value})
    end
    defp(deserialize(<<8, 3::16-signed, value::size(32), rest::binary>>, acc)) do
      deserialize(rest, %{acc | security: value})
    end
    defp(deserialize(<<11, 4::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | user_name: value})
    end
    defp(deserialize(<<11, 5::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | password: value})
    end
    defp(deserialize(<<2, 6::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | for_xa: true})
    end
    defp(deserialize(<<2, 6::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | for_xa: false})
    end
    defp(deserialize(<<8, 7::16-signed, value::size(32), rest::binary>>, acc)) do
      deserialize(rest, %{acc | token_size: value})
    end
    defp(deserialize(<<2, 8::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | use_string_for_decimal: true})
    end
    defp(deserialize(<<2, 8::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | use_string_for_decimal: false})
    end
    defp(deserialize(<<13, 9::16-signed, 11, 11, map_size::size(32), rest::binary>>, struct)) do
      deserialize__properties__key(rest, [%{}, map_size, struct])
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    defp(deserialize__properties__key(<<rest::binary>>, [map, 0, struct])) do
      deserialize(rest, %{struct | properties: map})
    end
    defp(deserialize__properties__key(<<string_size::32-signed, key::binary-size(string_size), rest::binary>>, stack)) do
      deserialize__properties__value(rest, key, stack)
    end
    defp(deserialize__properties__key(_, _)) do
      :error
    end
    defp(deserialize__properties__value(<<string_size::32-signed, value::binary-size(string_size), rest::binary>>, key, [map, remaining | stack])) do
      deserialize__properties__key(rest, [Map.put(map, key, value), remaining - 1 | stack])
    end
    defp(deserialize__properties__value(_, _, _)) do
      :error
    end
    def(serialize(%SnappyData.Thrift.OpenConnectionArgs{client_host_name: client_host_name, client_id: client_id, security: security, user_name: user_name, password: password, for_xa: for_xa, token_size: token_size, use_string_for_decimal: use_string_for_decimal, properties: properties})) do
      [case(client_host_name) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :client_host_name on SnappyData.Thrift.OpenConnectionArgs must not be nil")
        _ ->
          [<<11, 1::size(16), byte_size(client_host_name)::size(32)>> | client_host_name]
      end, case(client_id) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :client_id on SnappyData.Thrift.OpenConnectionArgs must not be nil")
        _ ->
          [<<11, 2::size(16), byte_size(client_id)::size(32)>> | client_id]
      end, case(security) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :security on SnappyData.Thrift.OpenConnectionArgs must not be nil")
        _ ->
          <<8, 3::size(16), security::32-signed>>
      end, case(user_name) do
        nil ->
          <<>>
        _ ->
          [<<11, 4::size(16), byte_size(user_name)::size(32)>> | user_name]
      end, case(password) do
        nil ->
          <<>>
        _ ->
          [<<11, 5::size(16), byte_size(password)::size(32)>> | password]
      end, case(for_xa) do
        nil ->
          <<>>
        false ->
          <<2, 6::size(16), 0>>
        true ->
          <<2, 6::size(16), 1>>
        _ ->
          raise(Thrift.InvalidValueException, "Optional boolean field :for_xa on SnappyData.Thrift.OpenConnectionArgs must be true, false, or nil")
      end, case(token_size) do
        nil ->
          <<>>
        _ ->
          <<8, 7::size(16), token_size::32-signed>>
      end, case(use_string_for_decimal) do
        nil ->
          <<>>
        false ->
          <<2, 8::size(16), 0>>
        true ->
          <<2, 8::size(16), 1>>
        _ ->
          raise(Thrift.InvalidValueException, "Optional boolean field :use_string_for_decimal on SnappyData.Thrift.OpenConnectionArgs must be true, false, or nil")
      end, case(properties) do
        nil ->
          <<>>
        _ ->
          [<<13, 9::size(16), 11, 11, Enum.count(properties)::size(32)>> | for({k, v} <- properties) do
            [<<byte_size(k)::size(32)>>, k, <<byte_size(v)::size(32)>> | v]
          end]
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