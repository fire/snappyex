defmodule(SnappyData.Thrift.PrepareResult) do
  _ = "Auto-generated Thrift struct snappydata.PrepareResult"
  _ = "1: i64 statement_id"
  _ = "2: i8 statement_type"
  _ = "3: list<snappydata.ColumnDescriptor> parameter_meta_data"
  _ = "4: list<snappydata.ColumnDescriptor> result_set_meta_data"
  _ = "5: snappydata.SnappyExceptionData warnings"
  defstruct(statement_id: nil, statement_type: nil, parameter_meta_data: nil, result_set_meta_data: nil, warnings: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    def(deserialize(binary)) do
      deserialize(binary, %SnappyData.Thrift.PrepareResult{})
    end
    defp(deserialize(<<0, rest::binary>>, %SnappyData.Thrift.PrepareResult{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<10, 1::16-signed, value::size(64), rest::binary>>, acc)) do
      deserialize(rest, %{acc | statement_id: value})
    end
    defp(deserialize(<<3, 2::16-signed, value, rest::binary>>, acc)) do
      deserialize(rest, %{acc | statement_type: value})
    end
    defp(deserialize(<<15, 3::16-signed, 12, remaining::size(32), rest::binary>>, struct)) do
      deserialize__parameter_meta_data(rest, [[], remaining, struct])
    end
    defp(deserialize(<<15, 4::16-signed, 12, remaining::size(32), rest::binary>>, struct)) do
      deserialize__result_set_meta_data(rest, [[], remaining, struct])
    end
    defp(deserialize(<<12, 5::16-signed, rest::binary>>, acc)) do
      case(Elixir.SnappyData.Thrift.SnappyExceptionData.BinaryProtocol.deserialize(rest)) do
        {value, rest} ->
          deserialize(rest, %{acc | warnings: value})
        :error ->
          :error
      end
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    defp(deserialize__parameter_meta_data(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | parameter_meta_data: Enum.reverse(list)})
    end
    defp(deserialize__parameter_meta_data(<<rest::binary>>, [list, remaining | stack])) do
      case(Elixir.SnappyData.Thrift.ColumnDescriptor.BinaryProtocol.deserialize(rest)) do
        {element, rest} ->
          deserialize__parameter_meta_data(rest, [[element | list], remaining - 1 | stack])
        :error ->
          :error
      end
    end
    defp(deserialize__parameter_meta_data(_, _)) do
      :error
    end
    defp(deserialize__result_set_meta_data(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | result_set_meta_data: Enum.reverse(list)})
    end
    defp(deserialize__result_set_meta_data(<<rest::binary>>, [list, remaining | stack])) do
      case(Elixir.SnappyData.Thrift.ColumnDescriptor.BinaryProtocol.deserialize(rest)) do
        {element, rest} ->
          deserialize__result_set_meta_data(rest, [[element | list], remaining - 1 | stack])
        :error ->
          :error
      end
    end
    defp(deserialize__result_set_meta_data(_, _)) do
      :error
    end
    def(serialize(%SnappyData.Thrift.PrepareResult{statement_id: statement_id, statement_type: statement_type, parameter_meta_data: parameter_meta_data, result_set_meta_data: result_set_meta_data, warnings: warnings})) do
      [case(statement_id) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :statement_id on SnappyData.Thrift.PrepareResult must not be nil")
        _ ->
          <<10, 1::size(16), statement_id::64-signed>>
      end, case(statement_type) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :statement_type on SnappyData.Thrift.PrepareResult must not be nil")
        _ ->
          <<3, 2::size(16), statement_type::8-signed>>
      end, case(parameter_meta_data) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :parameter_meta_data on SnappyData.Thrift.PrepareResult must not be nil")
        _ ->
          [<<15, 3::size(16), 12, length(parameter_meta_data)::size(32)>> | for(e <- parameter_meta_data) do
            SnappyData.Thrift.ColumnDescriptor.serialize(e)
          end]
      end, case(result_set_meta_data) do
        nil ->
          <<>>
        _ ->
          [<<15, 4::size(16), 12, length(result_set_meta_data)::size(32)>> | for(e <- result_set_meta_data) do
            SnappyData.Thrift.ColumnDescriptor.serialize(e)
          end]
      end, case(warnings) do
        nil ->
          <<>>
        _ ->
          [<<12, 5::size(16)>> | SnappyData.Thrift.SnappyExceptionData.serialize(warnings)]
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