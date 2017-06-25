defmodule(SnappyData.Thrift.SnappyExceptionData) do
  _ = "Auto-generated Thrift struct snappydata.SnappyExceptionData"
  _ = "1: string reason"
  _ = "2: i32 error_code"
  _ = "3: string sql_state"
  _ = "4: list<i32> update_counts"
  defstruct(reason: nil, error_code: nil, sql_state: nil, update_counts: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %SnappyData.Thrift.SnappyExceptionData{})
    end
    defp(deserialize(<<0, rest::binary>>, %SnappyData.Thrift.SnappyExceptionData{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<11, 1::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | reason: value})
    end
    defp(deserialize(<<8, 2::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | error_code: value})
    end
    defp(deserialize(<<11, 3::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | sql_state: value})
    end
    defp(deserialize(<<15, 4::16-signed, 8, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__update_counts(rest, [[], remaining, struct])
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    defp(deserialize__update_counts(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | update_counts: Enum.reverse(list)})
    end
    defp(deserialize__update_counts(<<element::32-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__update_counts(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__update_counts(_, _)) do
      :error
    end
    def(serialize(%SnappyData.Thrift.SnappyExceptionData{reason: reason, error_code: error_code, sql_state: sql_state, update_counts: update_counts})) do
      [case(reason) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :reason on SnappyData.Thrift.SnappyExceptionData must not be nil")
        _ ->
          [<<11, 1::16-signed, byte_size(reason)::32-signed>> | reason]
      end, case(error_code) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :error_code on SnappyData.Thrift.SnappyExceptionData must not be nil")
        _ ->
          <<8, 2::16-signed, error_code::32-signed>>
      end, case(sql_state) do
        nil ->
          <<>>
        _ ->
          [<<11, 3::16-signed, byte_size(sql_state)::32-signed>> | sql_state]
      end, case(update_counts) do
        nil ->
          <<>>
        _ ->
          [<<15, 4::16-signed, 8, length(update_counts)::32-signed>> | for(e <- update_counts) do
            <<e::32-signed>>
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