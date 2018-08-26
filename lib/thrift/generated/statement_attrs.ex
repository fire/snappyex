defmodule(Thrift.Generated.StatementAttrs) do
  _ = "Auto-generated Thrift struct snappydata.StatementAttrs"
  _ = "1: i8 result_set_type"
  _ = "2: bool updatable"
  _ = "3: bool hold_cursors_over_commit"
  _ = "4: bool require_auto_inc_cols"
  _ = "5: list<i32> auto_inc_columns"
  _ = "6: list<string> auto_inc_column_names"
  _ = "7: i32 batch_size"
  _ = "8: bool fetch_reverse"
  _ = "9: i32 lob_chunk_size"
  _ = "10: i32 max_rows"
  _ = "11: i32 max_field_size"
  _ = "12: i32 timeout"
  _ = "13: string cursor_name"
  _ = "14: bool possible_duplicate"
  _ = "15: bool poolable"
  _ = "16: bool do_escape_processing"
  _ = "17: map<snappydata.TransactionAttribute,bool> pending_transaction_attrs"
  _ = "18: set<i32> bucket_ids"
  _ = "19: string bucket_ids_table"
  _ = "20: bool retain_bucket_ids"
  _ = "21: i32 metadata_version"
  _ = "22: string snapshot_transaction_id"
  defstruct(result_set_type: nil, updatable: nil, hold_cursors_over_commit: nil, require_auto_inc_cols: nil, auto_inc_columns: nil, auto_inc_column_names: nil, batch_size: 8192, fetch_reverse: nil, lob_chunk_size: nil, max_rows: nil, max_field_size: nil, timeout: nil, cursor_name: nil, possible_duplicate: nil, poolable: nil, do_escape_processing: nil, pending_transaction_attrs: nil, bucket_ids: nil, bucket_ids_table: nil, retain_bucket_ids: nil, metadata_version: nil, snapshot_transaction_id: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %Thrift.Generated.StatementAttrs{})
    end
    defp(deserialize(<<0, rest::binary>>, %Thrift.Generated.StatementAttrs{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<3, 1::16-signed, value::8-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | result_set_type: value})
    end
    defp(deserialize(<<2, 2::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | updatable: true})
    end
    defp(deserialize(<<2, 2::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | updatable: false})
    end
    defp(deserialize(<<2, 3::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | hold_cursors_over_commit: true})
    end
    defp(deserialize(<<2, 3::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | hold_cursors_over_commit: false})
    end
    defp(deserialize(<<2, 4::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | require_auto_inc_cols: true})
    end
    defp(deserialize(<<2, 4::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | require_auto_inc_cols: false})
    end
    defp(deserialize(<<15, 5::16-signed, 8, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__auto_inc_columns(rest, [[], remaining, struct])
    end
    defp(deserialize(<<15, 6::16-signed, 11, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__auto_inc_column_names(rest, [[], remaining, struct])
    end
    defp(deserialize(<<8, 7::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | batch_size: value})
    end
    defp(deserialize(<<2, 8::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | fetch_reverse: true})
    end
    defp(deserialize(<<2, 8::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | fetch_reverse: false})
    end
    defp(deserialize(<<8, 9::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | lob_chunk_size: value})
    end
    defp(deserialize(<<8, 10::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | max_rows: value})
    end
    defp(deserialize(<<8, 11::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | max_field_size: value})
    end
    defp(deserialize(<<8, 12::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | timeout: value})
    end
    defp(deserialize(<<11, 13::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | cursor_name: value})
    end
    defp(deserialize(<<2, 14::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | possible_duplicate: true})
    end
    defp(deserialize(<<2, 14::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | possible_duplicate: false})
    end
    defp(deserialize(<<2, 15::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | poolable: true})
    end
    defp(deserialize(<<2, 15::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | poolable: false})
    end
    defp(deserialize(<<2, 16::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | do_escape_processing: true})
    end
    defp(deserialize(<<2, 16::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | do_escape_processing: false})
    end
    defp(deserialize(<<13, 17::16-signed, 8, 2, map_size::32-signed, rest::binary>>, struct)) do
      deserialize__pending_transaction_attrs__key(rest, [%{}, map_size, struct])
    end
    defp(deserialize(<<14, 18::16-signed, 8, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__bucket_ids(rest, [[], remaining, struct])
    end
    defp(deserialize(<<11, 19::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | bucket_ids_table: value})
    end
    defp(deserialize(<<2, 20::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | retain_bucket_ids: true})
    end
    defp(deserialize(<<2, 20::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | retain_bucket_ids: false})
    end
    defp(deserialize(<<8, 21::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | metadata_version: value})
    end
    defp(deserialize(<<11, 22::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | snapshot_transaction_id: value})
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    defp(deserialize__auto_inc_column_names(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | auto_inc_column_names: Enum.reverse(list)})
    end
    defp(deserialize__auto_inc_column_names(<<string_size::32-signed, element::binary-size(string_size), rest::binary>>, [list, remaining | stack])) do
      deserialize__auto_inc_column_names(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__auto_inc_column_names(_, _)) do
      :error
    end
    defp(deserialize__auto_inc_columns(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | auto_inc_columns: Enum.reverse(list)})
    end
    defp(deserialize__auto_inc_columns(<<element::32-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__auto_inc_columns(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__auto_inc_columns(_, _)) do
      :error
    end
    defp(deserialize__bucket_ids(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | bucket_ids: MapSet.new(list)})
    end
    defp(deserialize__bucket_ids(<<element::32-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__bucket_ids(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__bucket_ids(_, _)) do
      :error
    end
    defp(deserialize__pending_transaction_attrs__key(<<rest::binary>>, [map, 0, struct])) do
      deserialize(rest, %{struct | pending_transaction_attrs: map})
    end
    defp(deserialize__pending_transaction_attrs__key(<<key::32-signed, rest::binary>>, stack)) do
      deserialize__pending_transaction_attrs__value(rest, key, stack)
    end
    defp(deserialize__pending_transaction_attrs__key(_, _)) do
      :error
    end
    defp(deserialize__pending_transaction_attrs__value(<<0, rest::binary>>, key, [map, remaining | stack])) do
      deserialize__pending_transaction_attrs__key(rest, [Map.put(map, key, false), remaining - 1 | stack])
    end
    defp(deserialize__pending_transaction_attrs__value(<<1, rest::binary>>, key, [map, remaining | stack])) do
      deserialize__pending_transaction_attrs__key(rest, [Map.put(map, key, true), remaining - 1 | stack])
    end
    defp(deserialize__pending_transaction_attrs__value(_, _, _)) do
      :error
    end
    def(serialize(%Thrift.Generated.StatementAttrs{result_set_type: result_set_type, updatable: updatable, hold_cursors_over_commit: hold_cursors_over_commit, require_auto_inc_cols: require_auto_inc_cols, auto_inc_columns: auto_inc_columns, auto_inc_column_names: auto_inc_column_names, batch_size: batch_size, fetch_reverse: fetch_reverse, lob_chunk_size: lob_chunk_size, max_rows: max_rows, max_field_size: max_field_size, timeout: timeout, cursor_name: cursor_name, possible_duplicate: possible_duplicate, poolable: poolable, do_escape_processing: do_escape_processing, pending_transaction_attrs: pending_transaction_attrs, bucket_ids: bucket_ids, bucket_ids_table: bucket_ids_table, retain_bucket_ids: retain_bucket_ids, metadata_version: metadata_version, snapshot_transaction_id: snapshot_transaction_id})) do
      [case(result_set_type) do
        nil ->
          <<>>
        _ ->
          <<3, 1::16-signed, result_set_type::8-signed>>
      end, case(updatable) do
        nil ->
          <<>>
        false ->
          <<2, 2::16-signed, 0>>
        true ->
          <<2, 2::16-signed, 1>>
        _ ->
          raise(Thrift.InvalidValueError, "Optional boolean field :updatable on Thrift.Generated.StatementAttrs must be true, false, or nil")
      end, case(hold_cursors_over_commit) do
        nil ->
          <<>>
        false ->
          <<2, 3::16-signed, 0>>
        true ->
          <<2, 3::16-signed, 1>>
        _ ->
          raise(Thrift.InvalidValueError, "Optional boolean field :hold_cursors_over_commit on Thrift.Generated.StatementAttrs must be true, false, or nil")
      end, case(require_auto_inc_cols) do
        nil ->
          <<>>
        false ->
          <<2, 4::16-signed, 0>>
        true ->
          <<2, 4::16-signed, 1>>
        _ ->
          raise(Thrift.InvalidValueError, "Optional boolean field :require_auto_inc_cols on Thrift.Generated.StatementAttrs must be true, false, or nil")
      end, case(auto_inc_columns) do
        nil ->
          <<>>
        _ ->
          [<<15, 5::16-signed, 8, length(auto_inc_columns)::32-signed>> | for(e <- auto_inc_columns) do
            <<e::32-signed>>
          end]
      end, case(auto_inc_column_names) do
        nil ->
          <<>>
        _ ->
          [<<15, 6::16-signed, 11, length(auto_inc_column_names)::32-signed>> | for(e <- auto_inc_column_names) do
            [<<byte_size(e)::32-signed>> | e]
          end]
      end, case(batch_size) do
        nil ->
          <<>>
        _ ->
          <<8, 7::16-signed, batch_size::32-signed>>
      end, case(fetch_reverse) do
        nil ->
          <<>>
        false ->
          <<2, 8::16-signed, 0>>
        true ->
          <<2, 8::16-signed, 1>>
        _ ->
          raise(Thrift.InvalidValueError, "Optional boolean field :fetch_reverse on Thrift.Generated.StatementAttrs must be true, false, or nil")
      end, case(lob_chunk_size) do
        nil ->
          <<>>
        _ ->
          <<8, 9::16-signed, lob_chunk_size::32-signed>>
      end, case(max_rows) do
        nil ->
          <<>>
        _ ->
          <<8, 10::16-signed, max_rows::32-signed>>
      end, case(max_field_size) do
        nil ->
          <<>>
        _ ->
          <<8, 11::16-signed, max_field_size::32-signed>>
      end, case(timeout) do
        nil ->
          <<>>
        _ ->
          <<8, 12::16-signed, timeout::32-signed>>
      end, case(cursor_name) do
        nil ->
          <<>>
        _ ->
          [<<11, 13::16-signed, byte_size(cursor_name)::32-signed>> | cursor_name]
      end, case(possible_duplicate) do
        nil ->
          <<>>
        false ->
          <<2, 14::16-signed, 0>>
        true ->
          <<2, 14::16-signed, 1>>
        _ ->
          raise(Thrift.InvalidValueError, "Optional boolean field :possible_duplicate on Thrift.Generated.StatementAttrs must be true, false, or nil")
      end, case(poolable) do
        nil ->
          <<>>
        false ->
          <<2, 15::16-signed, 0>>
        true ->
          <<2, 15::16-signed, 1>>
        _ ->
          raise(Thrift.InvalidValueError, "Optional boolean field :poolable on Thrift.Generated.StatementAttrs must be true, false, or nil")
      end, case(do_escape_processing) do
        nil ->
          <<>>
        false ->
          <<2, 16::16-signed, 0>>
        true ->
          <<2, 16::16-signed, 1>>
        _ ->
          raise(Thrift.InvalidValueError, "Optional boolean field :do_escape_processing on Thrift.Generated.StatementAttrs must be true, false, or nil")
      end, case(pending_transaction_attrs) do
        nil ->
          <<>>
        _ ->
          [<<13, 17::16-signed, 8, 2, Enum.count(pending_transaction_attrs)::32-signed>> | for({k, v} <- pending_transaction_attrs) do
            [<<k::32-signed>> | case(v) do
              nil ->
                <<0>>
              false ->
                <<0>>
              _ ->
                <<1>>
            end]
          end]
      end, case(bucket_ids) do
        nil ->
          <<>>
        _ ->
          [<<14, 18::16-signed, 8, Enum.count(bucket_ids)::32-signed>> | for(e <- bucket_ids) do
            <<e::32-signed>>
          end]
      end, case(bucket_ids_table) do
        nil ->
          <<>>
        _ ->
          [<<11, 19::16-signed, byte_size(bucket_ids_table)::32-signed>> | bucket_ids_table]
      end, case(retain_bucket_ids) do
        nil ->
          <<>>
        false ->
          <<2, 20::16-signed, 0>>
        true ->
          <<2, 20::16-signed, 1>>
        _ ->
          raise(Thrift.InvalidValueError, "Optional boolean field :retain_bucket_ids on Thrift.Generated.StatementAttrs must be true, false, or nil")
      end, case(metadata_version) do
        nil ->
          <<>>
        _ ->
          <<8, 21::16-signed, metadata_version::32-signed>>
      end, case(snapshot_transaction_id) do
        nil ->
          <<>>
        _ ->
          [<<11, 22::16-signed, byte_size(snapshot_transaction_id)::32-signed>> | snapshot_transaction_id]
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