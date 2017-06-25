defmodule(SnappyData.Thrift.Row) do
  _ = "Auto-generated Thrift struct snappydata.Row"
  _ = "1: list<snappydata.ColumnValue> values"
  defstruct(values: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %SnappyData.Thrift.Row{})
    end
    defp(deserialize(<<0, rest::binary>>, %SnappyData.Thrift.Row{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<15, 1::16-signed, 12, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__values(rest, [[], remaining, struct])
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    defp(deserialize__values(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | values: Enum.reverse(list)})
    end
    defp(deserialize__values(<<rest::binary>>, [list, remaining | stack])) do
      case(Elixir.SnappyData.Thrift.ColumnValue.BinaryProtocol.deserialize(rest)) do
        {element, rest} ->
          deserialize__values(rest, [[element | list], remaining - 1 | stack])
        :error ->
          :error
      end
    end
    defp(deserialize__values(_, _)) do
      :error
    end
    def(serialize(%SnappyData.Thrift.Row{values: values})) do
      [case(values) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :values on SnappyData.Thrift.Row must not be nil")
        _ ->
          [<<15, 1::16-signed, 12, length(values)::32-signed>> | for(e <- values) do
            SnappyData.Thrift.ColumnValue.serialize(e)
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