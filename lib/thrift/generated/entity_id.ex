defmodule Thrift.Generated.EntityId do
  _ = "Auto-generated Thrift struct snappydata.EntityId"
  _ = "1: i64 id"
  _ = "2: i8 type"
  _ = "3: i64 conn_id"
  _ = "4: binary token"
  defstruct(id: nil, type: nil, conn_id: nil, token: nil)
  @type t :: %__MODULE__{}
  def new do
    %__MODULE__{}
  end

  defmodule BinaryProtocol do
    @moduledoc false
    def deserialize(binary) do
      deserialize(binary, %Thrift.Generated.EntityId{})
    end

    defp deserialize(<<0, rest::binary>>, %Thrift.Generated.EntityId{} = acc) do
      {acc, rest}
    end

    defp deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc) do
      deserialize(rest, %{acc | id: value})
    end

    defp deserialize(<<3, 2::16-signed, value::8-signed, rest::binary>>, acc) do
      deserialize(rest, %{acc | type: value})
    end

    defp deserialize(<<10, 3::16-signed, value::64-signed, rest::binary>>, acc) do
      deserialize(rest, %{acc | conn_id: value})
    end

    defp deserialize(
           <<11, 4::16-signed, string_size::32-signed, value::binary-size(string_size),
             rest::binary>>,
           acc
         ) do
      deserialize(rest, %{acc | token: value})
    end

    defp deserialize(<<field_type, _id::16-signed, rest::binary>>, acc) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end

    defp deserialize(_, _) do
      :error
    end

    def serialize(%Thrift.Generated.EntityId{id: id, type: type, conn_id: conn_id, token: token}) do
      [
        case id do
          nil ->
            raise(
              Thrift.InvalidValueError,
              "Required field :id on Thrift.Generated.EntityId must not be nil"
            )

          _ ->
            <<10, 1::16-signed, id::64-signed>>
        end,
        case type do
          nil ->
            raise(
              Thrift.InvalidValueError,
              "Required field :type on Thrift.Generated.EntityId must not be nil"
            )

          _ ->
            <<3, 2::16-signed, type::8-signed>>
        end,
        case conn_id do
          nil ->
            raise(
              Thrift.InvalidValueError,
              "Required field :conn_id on Thrift.Generated.EntityId must not be nil"
            )

          _ ->
            <<10, 3::16-signed, conn_id::64-signed>>
        end,
        case token do
          nil ->
            raise(
              Thrift.InvalidValueError,
              "Required field :token on Thrift.Generated.EntityId must not be nil"
            )

          _ ->
            [<<11, 4::16-signed, byte_size(token)::32-signed>> | token]
        end
        | <<0>>
      ]
    end
  end

  def serialize(struct) do
    BinaryProtocol.serialize(struct)
  end

  def serialize(struct, :binary) do
    BinaryProtocol.serialize(struct)
  end

  def deserialize(binary) do
    BinaryProtocol.deserialize(binary)
  end
end
