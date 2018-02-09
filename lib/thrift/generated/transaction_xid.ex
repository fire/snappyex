defmodule(Thrift.Generated.TransactionXid) do
  _ = "Auto-generated Thrift struct snappydata.TransactionXid"
  _ = "1: i32 format_id"
  _ = "2: binary global_id"
  _ = "3: binary branch_qualifier"
  defstruct(format_id: nil, global_id: nil, branch_qualifier: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %Thrift.Generated.TransactionXid{})
    end
    defp(deserialize(<<0, rest::binary>>, %Thrift.Generated.TransactionXid{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<8, 1::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | format_id: value})
    end
    defp(deserialize(<<11, 2::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | global_id: value})
    end
    defp(deserialize(<<11, 3::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | branch_qualifier: value})
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    def(serialize(%Thrift.Generated.TransactionXid{format_id: format_id, global_id: global_id, branch_qualifier: branch_qualifier})) do
      [case(format_id) do
        nil ->
          raise(Thrift.InvalidValueError, "Required field :format_id on Thrift.Generated.TransactionXid must not be nil")
        _ ->
          <<8, 1::16-signed, format_id::32-signed>>
      end, case(global_id) do
        nil ->
          raise(Thrift.InvalidValueError, "Required field :global_id on Thrift.Generated.TransactionXid must not be nil")
        _ ->
          [<<11, 2::16-signed, byte_size(global_id)::32-signed>> | global_id]
      end, case(branch_qualifier) do
        nil ->
          raise(Thrift.InvalidValueError, "Required field :branch_qualifier on Thrift.Generated.TransactionXid must not be nil")
        _ ->
          [<<11, 3::16-signed, byte_size(branch_qualifier)::32-signed>> | branch_qualifier]
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