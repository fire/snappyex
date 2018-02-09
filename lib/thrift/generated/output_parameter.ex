defmodule Thrift.Generated.OutputParameter do
  _ = "Auto-generated Thrift struct snappydata.OutputParameter"
  _ = "1: snappydata.SnappyType type"
  _ = "2: i32 scale"
  _ = "3: string type_name"
  defstruct(type: nil, scale: nil, type_name: nil)
  @type t :: %__MODULE__{}
  def new do
    %__MODULE__{}
  end

  defmodule BinaryProtocol do
    @moduledoc false
    def deserialize(binary) do
      deserialize(binary, %Thrift.Generated.OutputParameter{})
    end

    defp deserialize(<<0, rest::binary>>, %Thrift.Generated.OutputParameter{} = acc) do
      {acc, rest}
    end

    defp deserialize(<<8, 1::16-signed, value::32-signed, rest::binary>>, acc) do
      deserialize(rest, %{acc | type: value})
    end

    defp deserialize(<<8, 2::16-signed, value::32-signed, rest::binary>>, acc) do
      deserialize(rest, %{acc | scale: value})
    end

    defp deserialize(
           <<11, 3::16-signed, string_size::32-signed, value::binary-size(string_size),
             rest::binary>>,
           acc
         ) do
      deserialize(rest, %{acc | type_name: value})
    end

    defp deserialize(<<field_type, _id::16-signed, rest::binary>>, acc) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end

    defp deserialize(_, _) do
      :error
    end

    def serialize(%Thrift.Generated.OutputParameter{
          type: type,
          scale: scale,
          type_name: type_name
        }) do
      [
        case type do
          nil ->
            raise(
              Thrift.InvalidValueError,
              "Required field :type on Thrift.Generated.OutputParameter must not be nil"
            )

          _ ->
            <<8, 1::16-signed, type::32-signed>>
        end,
        case scale do
          nil ->
            <<>>

          _ ->
            <<8, 2::16-signed, scale::32-signed>>
        end,
        case type_name do
          nil ->
            <<>>

          _ ->
            [<<11, 3::16-signed, byte_size(type_name)::32-signed>> | type_name]
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
