defmodule Thrift.Generated.ConnectionProperties do
  _ = "Auto-generated Thrift struct snappydata.ConnectionProperties"
  _ = "1: i64 conn_id"
  _ = "2: string client_host_name"
  _ = "3: string client_id"
  _ = "4: string user_name"
  _ = "5: binary token"
  _ = "6: string default_schema"

  defstruct(
    conn_id: nil,
    client_host_name: nil,
    client_id: nil,
    user_name: nil,
    token: nil,
    default_schema: nil
  )

  @type t :: %__MODULE__{}
  def new do
    %__MODULE__{}
  end

  defmodule BinaryProtocol do
    @moduledoc false
    def deserialize(binary) do
      deserialize(binary, %Thrift.Generated.ConnectionProperties{})
    end

    defp deserialize(<<0, rest::binary>>, %Thrift.Generated.ConnectionProperties{} = acc) do
      {acc, rest}
    end

    defp deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc) do
      deserialize(rest, %{acc | conn_id: value})
    end

    defp deserialize(
           <<11, 2::16-signed, string_size::32-signed, value::binary-size(string_size),
             rest::binary>>,
           acc
         ) do
      deserialize(rest, %{acc | client_host_name: value})
    end

    defp deserialize(
           <<11, 3::16-signed, string_size::32-signed, value::binary-size(string_size),
             rest::binary>>,
           acc
         ) do
      deserialize(rest, %{acc | client_id: value})
    end

    defp deserialize(
           <<11, 4::16-signed, string_size::32-signed, value::binary-size(string_size),
             rest::binary>>,
           acc
         ) do
      deserialize(rest, %{acc | user_name: value})
    end

    defp deserialize(
           <<11, 5::16-signed, string_size::32-signed, value::binary-size(string_size),
             rest::binary>>,
           acc
         ) do
      deserialize(rest, %{acc | token: value})
    end

    defp deserialize(
           <<11, 6::16-signed, string_size::32-signed, value::binary-size(string_size),
             rest::binary>>,
           acc
         ) do
      deserialize(rest, %{acc | default_schema: value})
    end

    defp deserialize(<<field_type, _id::16-signed, rest::binary>>, acc) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end

    defp deserialize(_, _) do
      :error
    end

    def serialize(%Thrift.Generated.ConnectionProperties{
          conn_id: conn_id,
          client_host_name: client_host_name,
          client_id: client_id,
          user_name: user_name,
          token: token,
          default_schema: default_schema
        }) do
      [
        case conn_id do
          nil ->
            raise(
              Thrift.InvalidValueError,
              "Required field :conn_id on Thrift.Generated.ConnectionProperties must not be nil"
            )

          _ ->
            <<10, 1::16-signed, conn_id::64-signed>>
        end,
        case client_host_name do
          nil ->
            raise(
              Thrift.InvalidValueError,
              "Required field :client_host_name on Thrift.Generated.ConnectionProperties must not be nil"
            )

          _ ->
            [<<11, 2::16-signed, byte_size(client_host_name)::32-signed>> | client_host_name]
        end,
        case client_id do
          nil ->
            raise(
              Thrift.InvalidValueError,
              "Required field :client_id on Thrift.Generated.ConnectionProperties must not be nil"
            )

          _ ->
            [<<11, 3::16-signed, byte_size(client_id)::32-signed>> | client_id]
        end,
        case user_name do
          nil ->
            <<>>

          _ ->
            [<<11, 4::16-signed, byte_size(user_name)::32-signed>> | user_name]
        end,
        case token do
          nil ->
            <<>>

          _ ->
            [<<11, 5::16-signed, byte_size(token)::32-signed>> | token]
        end,
        case default_schema do
          nil ->
            <<>>

          _ ->
            [<<11, 6::16-signed, byte_size(default_schema)::32-signed>> | default_schema]
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
