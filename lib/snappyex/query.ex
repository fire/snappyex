# Portions from https://github.com/elixir-ecto/postgrex/blob/af1b62ae06121f02f2d63f1446eb99b962884edb/lib/postgrex/extensions/numeric.ex

defmodule Snappyex.Query do
  defstruct [:ref, :name, :statement, :param_formats, :encoders, :columns, :result_set_meta_data,
             :result_formats, :num_params, :decoders, :types]

  def query_columns_list(map) do
    columns = Enum.reduce(
      map, [], fn (x, acc) ->
          if is_map(x) and Map.has_key?(x, :name) do
            {:ok, type} = SnappyData.Thrift.SnappyType.value_to_name(x.type)
            [type | acc]
          else
            acc
          end
        end
      )
      Enum.reverse(columns)
  end
end

defimpl DBConnection.Query, for: Snappyex.Query do
  alias Snappyex.Query
  use Timex
  def describe(%Query{} = query, _opts) do
    query
  end
  def encode(%Query{types: nil} = query, _params, _) do
    raise ArgumentError, "query #{inspect query} has not been prepared"
  end
  def encode(%Query{types: []} = query, _params, _) do
    raise ArgumentError, "query #{inspect query} does not have matching input parameters to types"
  end
  def encode(%Query{types: types}, params, _opts) do
    encode(types, params)
  end
  def encode(types, params) do
    %SnappyData.Thrift.Row{values: encode_values(types, params, [])}
  end
  def encode_values([], [param | params], acc) when is_integer(param) do
    encode_values([], [], [encode_field(param, :bigint) | acc])
  end
  def encode_values([type | types], [param | params], acc) do
    encode_values(types, params, [encode_field(param, type) | acc])
  end
  def encode_values([], [], acc), do: Enum.reverse(acc)
  def encode_field(field, :integer) do
    %SnappyData.Thrift.ColumnValue{i32_val: field}
  end
  def encode_field(field, :bigint) do
    %SnappyData.Thrift.ColumnValue{i64_val: field}
  end
  def encode_field(field, :timestamp) do
    %SnappyData.Thrift.ColumnValue{timestamp_val: DateTime.to_unix(field)}
  end
  def encode_field(field, :varchar) do
    %SnappyData.Thrift.ColumnValue{clob_val:
      %SnappyData.Thrift.ClobChunk{
        chunk: field,
        last: true,
        total_length: byte_size(field)
      }
    }
  end
  def encode_field(field, :clob) do
    %SnappyData.Thrift.ColumnValue{clob_val:
      %SnappyData.Thrift.ClobChunk{
        chunk: field,
        last: true,
        total_length: byte_size(field)
      }
    }
  end
  def encode_field(field, :double) do
    %SnappyData.Thrift.ColumnValue{double_val: field}
  end
  def encode_field(field, :float) do
    use Bitwise, only_operators: true
    field = :io.format("~f", field)
    %SnappyData.Thrift.ColumnValue{float_val: :erlang.float_to_binary(field)}
  end
  def decode(rows, columns), do: decode(rows, columns, [])
  def decode([row | rows], columns, acc) do
    decode(rows, columns, [decode_row(row.values, columns, []) | acc])
  end
  def decode([], _, acc), do: Enum.reverse(acc)
  def decode(%Query{decoders: nil, columns: _columns}, res, _) do
    _mapper = fn x -> x end
    {:ok, rows} = Map.fetch(res, :rows)
    rows = decode_row_set(rows)
    num_rows = case rows do
      nil -> 0
      _ -> length(rows)
    end
    %Snappyex.Result{rows: rows, num_rows: num_rows}
  end
  def decode_row([field | rows], [decoder | cols], acc) do
    {:ok, type} = SnappyData.Thrift.SnappyType.value_to_name(decoder)
    decode_row(rows, cols, [decode_field(field, type) | acc])
  end
  def decode_row([], [], acc), do: Enum.reverse(acc)
  def decode_field(value, :boolean), do: value.bool_val
  def decode_field(value, :tinyint), do: value.i16_val
  def decode_field(value, :integer) do
    value.i32_val
  end
  def decode_field(value, :bigint), do: value.i64_val
  def decode_field(value, :float) do
  # http://grepcode.com/file/repository.grepcode.com/java/root/jdk/openjdk/6-b27/java/lang/Float.java#Float.floatToIntBits%28float%29
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
  # Then the floating-point result equals the value of the mathematical expression s·m·2^e-150.
    use Bitwise
    bits = value.float_val
    s = if (bits >>> 31) == 0 do
      1
    else
      -1
    end
    e = (bits >>> 23) &&& 0xff
    m = if e == 0 do
      (bits &&& 0x7fffff) <<< 1
    else
      (bits &&& 0x7fffff) ||| 0x800000
    end
    s*m*:math.pow(2,e-150)
  end
#  def decode_field(column_value, :real), do: elem(column_value, @decimal_val)
  def decode_field(value, :double), do: value.double_val
#  def decode_field(value, :decimal) do
#    %SnappyData.Thrift.Decimal{magnitude: _magnitude, scale: _scale, signum: _signum} = value.decimal_val
#    #decode_numeric(signum, magnitude)
#  end

  def decode_field(value, :char), do: value.string_val
  def decode_field(value, :varchar), do: value.string_val
#  def decode_field(column_value, :longvarchar), do: elem(column_value, @string_val)
  def decode_field(value, :date) do
    {:ok, date} = DateTime.from_unix(value.date_val)
    date
  end
  def decode_field(value, :time) do
    {:ok, time} = DateTime.from_unix(value.time_val)
    {_, {hour, minute, second}} = Timex.to_erl(time)
    {hour, minute, second, 0}
  end
  def decode_field(value, :nulltype) do
    if value.null_val do
      nil
    end
  end
  def decode_field(value, :timestamp) do
    # TODO Extract nanoseconds and add it to time
    # https://github.com/elixir-ecto/postgrex/blob/master/lib/postgrex/extensions/timestamp.ex#L24
    {:ok, timestamp} = DateTime.from_unix(value.timestamp_val)
    timestamp
  end
  def decode_field(value, :binary), do: value.binary_val
  def decode_field(value, :varbinary), do: value.binary_val
  def decode_field(value, :longvarbinary), do: value.binary_val
  def decode_field(value, :longvarchar), do: value.string_val
  def decode_field(value, :blob), do: decode_blob(value.blob_val)
  def decode_field(value, :clob) do
    decode_clob(value.clob_val)
  end
#  def decode_field(column_value, :sqlxml), do: elem(column_value, @string_val)
#  def decode_field(column_value, :array), do: elem(column_value, )
#  def decode_field(column_value, :map), do: elem(column_value, )
#  def decode_field(column_value, :struct), do: elem(column_value, )
  def decode_field(value, :other), do: raise ArgumentError, "can not be decoded: " <> IO.inspect(value)
  def decode_field(value, :json_object), do: value.json_val
  def decode_field(value, :java_object), do: value.java_val

  def decode_blob(val) do
    case val do
      %SnappyData.Thrift.BlobChunk{chunk: _chunk, last: true} -> val
      %SnappyData.Thrift.BlobChunk{last: false} -> raise "Not Implemented"
      nil -> nil
    end
  end

  def decode_clob(val) do
    case val do
      %SnappyData.Thrift.ClobChunk{chunk: chunk, last: true} -> chunk
      %SnappyData.Thrift.ClobChunk{last: false} -> raise "Not Implemented"
      nil -> nil
    end
  end

  def decode_row_set(nil) do
    nil
  end

  def decode_row_set(%SnappyData.Thrift.RowSet{rows: rows, metadata: metadata}) do
    columns = Enum.map(metadata, fn descriptor ->
      %SnappyData.Thrift.ColumnDescriptor{type: ordinal} = descriptor
      ordinal
    end)
    decode(rows, columns)
  end
  def parse(query, _) do
    query
  end
end

defimpl String.Chars, for: Snappyex.Query do
  def to_string(%Snappyex.Query{statement: statement}) do
    IO.iodata_to_binary(statement)
  end
end
