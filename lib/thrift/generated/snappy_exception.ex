defmodule(Thrift.Generated.SnappyException) do
  _ = "Auto-generated Thrift exception snappydata.SnappyException"
  _ = "1: snappydata.SnappyExceptionData exception_data"
  _ = "2: string server_info"
  _ = "3: list<snappydata.SnappyExceptionData> next_exceptions"
  defexception(exception_data: nil, server_info: nil, next_exceptions: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  (
    @spec(message(Exception.t()) :: String.t())
    def(message(exception)) do
      inspect(exception)
    end
  )
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %Thrift.Generated.SnappyException{})
    end
    defp(deserialize(<<0, rest::binary>>, %Thrift.Generated.SnappyException{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
      case(Elixir.Thrift.Generated.SnappyExceptionData.BinaryProtocol.deserialize(rest)) do
        {value, rest} ->
          deserialize(rest, %{acc | exception_data: value})
        :error ->
          :error
      end
    end
    defp(deserialize(<<11, 2::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | server_info: value})
    end
    defp(deserialize(<<15, 3::16-signed, 12, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__next_exceptions(rest, [[], remaining, struct])
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    defp(deserialize__next_exceptions(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | next_exceptions: Enum.reverse(list)})
    end
    defp(deserialize__next_exceptions(<<rest::binary>>, [list, remaining | stack])) do
      case(Elixir.Thrift.Generated.SnappyExceptionData.BinaryProtocol.deserialize(rest)) do
        {element, rest} ->
          deserialize__next_exceptions(rest, [[element | list], remaining - 1 | stack])
        :error ->
          :error
      end
    end
    defp(deserialize__next_exceptions(_, _)) do
      :error
    end
    def(serialize(%Thrift.Generated.SnappyException{exception_data: exception_data, server_info: server_info, next_exceptions: next_exceptions})) do
      [case(exception_data) do
        nil ->
          raise(Thrift.InvalidValueError, "Required field :exception_data on Thrift.Generated.SnappyException must not be nil")
        _ ->
          [<<12, 1::16-signed>> | Thrift.Generated.SnappyExceptionData.serialize(exception_data)]
      end, case(server_info) do
        nil ->
          raise(Thrift.InvalidValueError, "Required field :server_info on Thrift.Generated.SnappyException must not be nil")
        _ ->
          [<<11, 2::16-signed, byte_size(server_info)::32-signed>> | server_info]
      end, case(next_exceptions) do
        nil ->
          <<>>
        _ ->
          [<<15, 3::16-signed, 12, length(next_exceptions)::32-signed>> | for(e <- next_exceptions) do
            Thrift.Generated.SnappyExceptionData.serialize(e)
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