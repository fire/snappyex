# Portions from https://github.com/elixir-ecto/postgrex/blob/
# af1b62ae06121f02f2d63f1446eb99b962884edb/lib/postgrex/
# extensions/numeric.ex

require Logger

defmodule Snappyex.Query do
  alias Thrift.Generated.SnappyType, as: SnappyType

  defstruct [
    :ref,
    :name,
    :statement,
    :param_formats,
    :param_types,
    :encoders,
    :columns,
    :result_formats,
    :result_types,
    :num_params,
    :decoders,
    :types
  ]

  def query_columns_list(map) do
    for type <- map do
      {:ok, type} = SnappyType.value_to_name(type.type)
      type
    end
  end
end

defimpl DBConnection.Query, for: Snappyex.Query do
  alias Snappyex.Query
  require Thrift.Generated.SnappyType
  require Thrift.Generated.OutputParameter

  def describe(%Query{} = query, _opts) do
    query
  end

  def encode(%Query{param_formats: param_formats}, params, _opts) do
    {encode_output_parameters(param_formats, params),
    encode(param_formats, params)}
  end

  defp encode_outputs([params | param], acc) do
    encode_outputs(params, [encode_output(param) | acc])
  end

  defp encode_outputs([], acc) do
    acc = Enum.map(acc, fn x -> encode_output(x) end)
    Enum.reverse(acc)
  end

  defp encode_output(param) when is_integer(param) do
    %Thrift.Generated.OutputParameter{type: Thrift.Generated.SnappyType.integer()}
  end

  defp encode_output_parameters(param_formats, params) do
    if param_formats == [] do
      1..length(params)
      |> Enum.to_list()
      |> Enum.zip(encode_outputs(param_formats, params))
      |> Enum.into(%{})
    else
      param_formats
    end
  end

  defp encode(types, params) do
    %Thrift.Generated.Row{values: encode_values(types, params, [])}
  end

  defp encode_values([type | types], [param | params], acc) do
    encode_values(types, params, [encode_field(param, type) | acc])
  end

  defp encode_values([] = types, [param | params], acc) when is_integer(param) do
    encode_values(types, params, [encode_field(param, :integer) | acc])
  end

  defp encode_values([] = types, [param | params], acc) when is_binary(param) do
    encode_values(types, params, [encode_field(param, :varchar) | acc])
  end

  defp encode_values([], [], acc), do: Enum.reverse(acc)

  defp encode_field(field, :integer) do
    %Thrift.Generated.ColumnValue{i32_val: field}
  end

  defp encode_field(field, :bigint) do
    %Thrift.Generated.ColumnValue{i64_val: field}
  end

  defp encode_field(field, :timestamp) do
    {date, time} = field
    {h, m, s, microsecond} = time
    {:ok, field} = NaiveDateTime.from_erl({date, {h, m, s}}, {microsecond, 0})
    {:ok, field} = DateTime.from_naive(field, "Etc/UTC")
    %Thrift.Generated.ColumnValue{timestamp_val: DateTime.to_unix(field, :nanosecond)}
  end

  defp encode_field(field, :varchar) do
    %Thrift.Generated.ColumnValue{
      clob_val: %Thrift.Generated.ClobChunk{
        chunk: field,
        last: true,
        total_length: byte_size(field)
      }
    }
  end

  defp encode_field(field, :clob) do
    %Thrift.Generated.ColumnValue{
      clob_val: %Thrift.Generated.ClobChunk{
        chunk: field,
        last: true,
        total_length: byte_size(field)
      }
    }
  end

  defp encode_field(field, :double) do
    %Thrift.Generated.ColumnValue{double_val: field}
  end

  defp encode_field(field, :float) do
    use Bitwise, only_operators: true
    field = :io.format("~f", field)
    %Thrift.Generated.ColumnValue{float_val: :erlang.float_to_binary(field)}
  end

  defp decode(rows, columns), do: decode(rows, columns, [])

  def decode([row | rows], columns, acc) do
    decode(rows, columns, [decode_row(row.values, columns, []) | acc])
  end

  def decode([], _, acc), do: Enum.reverse(acc)

  def decode(%Query{decoders: _decoders, columns: columns}, res, opts) do
    _mapper = fn x -> x end
    {:ok, row_set} = Map.fetch(res, :rows)
    rows = decode_row_set(row_set)

    %Snappyex.Result{
      res
      | columns: columns,
        rows: decode_map(rows, opts),
        connection_id: decode_row_set_connection_id(row_set)
    }
  end

  defp decode_row_set_connection_id(%Thrift.Generated.RowSet{conn_id: conn_id}) do
    conn_id
  end

  defp decode_row_set_connection_id(nil) do
    nil
  end

  defp decode_row([field | rows], [decoder | cols], acc) do
    {:ok, type} = Thrift.Generated.SnappyType.value_to_name(decoder)
    decode_row(rows, cols, [decode_field(field, type) | acc])
  end

  defp decode_row([], [], acc), do: Enum.reverse(acc)
  defp decode_field(value, :boolean), do: value.bool_val
  defp decode_field(value, :tinyint), do: value.i16_val
  defp decode_field(value, :integer), do: value.i32_val
  defp decode_field(value, :bigint), do: value.i64_val

  defp decode_field(value, :float) do
    # http://grepcode.com/file/repository.grepcode.com/
    # java/root/jdk/openjdk/6-b27/java/lang/
    # Float.java#Float.floatToIntBits%28float%29
    #
    #  public static int floatToIntBits(float value) {
    #       int result = floatToRawIntBits(value);
    #       // Check for NaN based on values of bit fields, maximum
    #       // exponent and nonzero significand.
    #       if ( ((result & FloatConsts.EXP_BIT_MASK) ==
    #             FloatConsts.EXP_BIT_MASK) &&
    #            (result & FloatConsts.SIGNIF_BIT_MASK) != 0)
    #           result = 0x7fc00000;
    #       return result;
    #      }
    #  int s = ((bits >> 31) == 0) ? 1 : -1;
    #  int e = ((bits >> 23) & 0xff);
    #  int m = (e == 0) ?
    #                  (bits & 0x7fffff) << 1 :
    #                  (bits & 0x7fffff) | 0x800000;
    # Then the floating-point result equals the value of the mathematical
    # expression s·m·2^e-150.
    use Bitwise
    bits = value.float_val

    s =
      if bits >>> 31 == 0 do
        1
      else
        -1
      end

    e = bits >>> 23 &&& 0xFF

    m =
      if e == 0 do
        (bits &&& 0x7FFFFF) <<< 1
      else
        (bits &&& 0x7FFFFF) ||| 0x800000
      end

    s * m * :math.pow(2, e - 150)
  end

  #  def decode_field(column_value, :real), do: elem(column_value, @decimal_val)
  defp decode_field(value, :double), do: value.double_val
  #  def decode_field(value, :decimal) do
  #    %SnappyData.Thrift.Decimal{magnitude: _magnitude,
  #    scale: _scale,
  #    signum: _signum} = value.decimal_val
  #    #decode_numeric(signum, magnitude)
  #  end

  defp decode_field(value, :char), do: value.string_val
  defp decode_field(value, :varchar), do: value.string_val
  # def decode_field(column_value, :longvarchar),
  # do: elem(column_value, @string_val)
  defp decode_field(value, :date) do
    {:ok, date} = DateTime.from_unix(value.date_val)
    DateTime.to_naive(date)
  end

  defp decode_field(value, :time) do
    {:ok, time} = DateTime.from_unix(value.time_val)
    {hour, minute, second} = Time.to_erl(time)
    {hour, minute, second, 0}
  end

  defp decode_field(value, :nulltype) do
    if value.null_val do
      nil
    end
  end

  defp decode_field(value, :timestamp) do
    # TODO Extract nanoseconds and add it to time
    # https://github.com/elixir-ecto/postgrex/
    # blob/master/lib/postgrex/extensions/timestamp.ex#L24
    {:ok, timestamp} = DateTime.from_unix(value.timestamp_val, :nanosecond)
    DateTime.to_naive(timestamp)
  end

  defp decode_field(value, :binary), do: value.binary_val
  defp decode_field(value, :varbinary), do: value.binary_val
  defp decode_field(value, :longvarbinary), do: value.binary_val
  defp decode_field(value, :longvarchar), do: value.string_val
  defp decode_field(value, :blob), do: decode_blob(value.blob_val)

  defp decode_field(value, :clob) do
    decode_clob(value.clob_val)
  end

  #  def decode_field(column_value, :sqlxml), do: elem(column_value, @string_val)
  #  def decode_field(column_value, :array), do: elem(column_value, )
  #  def decode_field(column_value, :map), do: elem(column_value, )
  #  def decode_field(column_value, :struct), do: elem(column_value, )
  defp decode_field(value, :other),
    do: raise(ArgumentError, "can not be decoded: " <> inspect(value))

  defp decode_field(value, :json_object), do: value.json_val
  defp decode_field(value, :java_object), do: value.java_val

  defp decode_blob(val) do
    case val do
      %Thrift.Generated.BlobChunk{chunk: _chunk, last: true} -> val
      %Thrift.Generated.BlobChunk{last: false} -> raise "Not Implemented"
      nil -> nil
    end
  end

  defp decode_clob(val) do
    case val do
      %Thrift.Generated.ClobChunk{chunk: chunk, last: true} -> chunk
      %Thrift.Generated.ClobChunk{last: false} -> raise "Not Implemented"
      nil -> nil
    end
  end

  defp decode_row_set(nil) do
    nil
  end

  defp decode_row_set(%Thrift.Generated.RowSet{rows: rows, metadata: metadata}) do
    columns =
      Enum.map(metadata, fn descriptor ->
        %Thrift.Generated.ColumnDescriptor{type: ordinal} = descriptor
        ordinal
      end)

    decode(rows, columns)
  end

  def parse(query, _) do
    query
  end

  defp decode_map(data, opts) do
    case opts[:decode_mapper] do
      nil ->
        case data do
          nil ->
            nil

          data ->
            data
        end

        Enum.reverse(data)

      mapper ->
        decode_map(data, mapper, [])
    end
  end

  defp decode_map([row | data], mapper, decoded) do
    decode_map(data, mapper, [mapper.(row) | decoded])
  end

  defp decode_map([], _, decoded) do
    decoded
  end

  defp decode_map(nil, _, decoded) do
    nil
  end
end

defimpl String.Chars, for: Snappyex.Query do
  def to_string(%Snappyex.Query{statement: statement}) do
    IO.iodata_to_binary(statement)
  end
end
