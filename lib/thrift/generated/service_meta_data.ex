defmodule(Thrift.Generated.ServiceMetaData) do
  _ = "Auto-generated Thrift struct snappydata.ServiceMetaData"
  _ = "1: string product_name"
  _ = "2: string product_version"
  _ = "3: i32 product_major_version"
  _ = "4: i32 product_minor_version"
  _ = "5: i32 jdbc_major_version"
  _ = "6: i32 jdbc_minor_version"
  _ = "7: string identifier_quote"
  _ = "8: list<string> sql_keywords"
  _ = "9: list<string> numeric_functions"
  _ = "10: list<string> string_functions"
  _ = "11: list<string> system_functions"
  _ = "12: list<string> date_time_functions"
  _ = "13: string search_string_escape"
  _ = "14: string extra_name_characters"
  _ = "15: map<snappydata.SnappyType,set<snappydata.SnappyType>> supported_convert"
  _ = "16: string schema_term"
  _ = "17: string procedure_term"
  _ = "18: string catalog_term"
  _ = "19: string catalog_separator"
  _ = "20: i32 max_binary_literal_length"
  _ = "21: i32 max_char_literal_length"
  _ = "22: i32 max_columns_in_group_by"
  _ = "23: i32 max_columns_in_index"
  _ = "24: i32 max_columns_in_order_by"
  _ = "25: i32 max_columns_in_select"
  _ = "26: i32 max_columns_in_table"
  _ = "27: i32 max_connections"
  _ = "28: i32 max_index_length"
  _ = "29: i32 max_row_size"
  _ = "30: i32 max_statement_length"
  _ = "31: i32 max_open_statements"
  _ = "32: i32 max_table_names_in_select"
  _ = "33: i32 max_column_name_length"
  _ = "34: i32 max_cursor_name_length"
  _ = "35: i32 max_schema_name_length"
  _ = "36: i32 max_procedure_name_length"
  _ = "37: i32 max_catalog_name_length"
  _ = "38: i32 max_table_name_length"
  _ = "39: i32 max_user_name_length"
  _ = "40: i32 default_transaction_isolation"
  _ = "41: i8 default_result_set_type"
  _ = "42: bool default_result_set_holdability_hold_cursors_over_commit"
  _ = "43: bool sql_state_is_x_open"
  _ = "44: bool catalog_at_start"
  _ = "45: map<snappydata.TransactionAttribute,bool> transaction_defaults"
  _ = "46: snappydata.RowIdLifetime row_id_life_time"
  _ = "47: set<snappydata.ServiceFeature> supported_features"
  _ = "48: map<snappydata.ServiceFeatureParameterized,list<i32>> features_with_params"
  defstruct(product_name: nil, product_version: nil, product_major_version: nil, product_minor_version: nil, jdbc_major_version: nil, jdbc_minor_version: nil, identifier_quote: nil, sql_keywords: nil, numeric_functions: nil, string_functions: nil, system_functions: nil, date_time_functions: nil, search_string_escape: nil, extra_name_characters: nil, supported_convert: nil, schema_term: nil, procedure_term: nil, catalog_term: nil, catalog_separator: nil, max_binary_literal_length: nil, max_char_literal_length: nil, max_columns_in_group_by: nil, max_columns_in_index: nil, max_columns_in_order_by: nil, max_columns_in_select: nil, max_columns_in_table: nil, max_connections: nil, max_index_length: nil, max_row_size: nil, max_statement_length: nil, max_open_statements: nil, max_table_names_in_select: nil, max_column_name_length: nil, max_cursor_name_length: nil, max_schema_name_length: nil, max_procedure_name_length: nil, max_catalog_name_length: nil, max_table_name_length: nil, max_user_name_length: nil, default_transaction_isolation: nil, default_result_set_type: nil, default_result_set_holdability_hold_cursors_over_commit: nil, sql_state_is_x_open: nil, catalog_at_start: nil, transaction_defaults: nil, row_id_life_time: nil, supported_features: nil, features_with_params: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    @moduledoc(false)
    def(deserialize(binary)) do
      deserialize(binary, %Thrift.Generated.ServiceMetaData{})
    end
    defp(deserialize(<<0, rest::binary>>, %Thrift.Generated.ServiceMetaData{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<11, 1::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | product_name: value})
    end
    defp(deserialize(<<11, 2::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | product_version: value})
    end
    defp(deserialize(<<8, 3::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | product_major_version: value})
    end
    defp(deserialize(<<8, 4::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | product_minor_version: value})
    end
    defp(deserialize(<<8, 5::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | jdbc_major_version: value})
    end
    defp(deserialize(<<8, 6::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | jdbc_minor_version: value})
    end
    defp(deserialize(<<11, 7::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | identifier_quote: value})
    end
    defp(deserialize(<<15, 8::16-signed, 11, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__sql_keywords(rest, [[], remaining, struct])
    end
    defp(deserialize(<<15, 9::16-signed, 11, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__numeric_functions(rest, [[], remaining, struct])
    end
    defp(deserialize(<<15, 10::16-signed, 11, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__string_functions(rest, [[], remaining, struct])
    end
    defp(deserialize(<<15, 11::16-signed, 11, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__system_functions(rest, [[], remaining, struct])
    end
    defp(deserialize(<<15, 12::16-signed, 11, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__date_time_functions(rest, [[], remaining, struct])
    end
    defp(deserialize(<<11, 13::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | search_string_escape: value})
    end
    defp(deserialize(<<11, 14::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | extra_name_characters: value})
    end
    defp(deserialize(<<13, 15::16-signed, 8, 14, map_size::32-signed, rest::binary>>, struct)) do
      deserialize__supported_convert__key(rest, [%{}, map_size, struct])
    end
    defp(deserialize(<<11, 16::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | schema_term: value})
    end
    defp(deserialize(<<11, 17::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | procedure_term: value})
    end
    defp(deserialize(<<11, 18::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | catalog_term: value})
    end
    defp(deserialize(<<11, 19::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | catalog_separator: value})
    end
    defp(deserialize(<<8, 20::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | max_binary_literal_length: value})
    end
    defp(deserialize(<<8, 21::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | max_char_literal_length: value})
    end
    defp(deserialize(<<8, 22::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | max_columns_in_group_by: value})
    end
    defp(deserialize(<<8, 23::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | max_columns_in_index: value})
    end
    defp(deserialize(<<8, 24::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | max_columns_in_order_by: value})
    end
    defp(deserialize(<<8, 25::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | max_columns_in_select: value})
    end
    defp(deserialize(<<8, 26::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | max_columns_in_table: value})
    end
    defp(deserialize(<<8, 27::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | max_connections: value})
    end
    defp(deserialize(<<8, 28::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | max_index_length: value})
    end
    defp(deserialize(<<8, 29::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | max_row_size: value})
    end
    defp(deserialize(<<8, 30::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | max_statement_length: value})
    end
    defp(deserialize(<<8, 31::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | max_open_statements: value})
    end
    defp(deserialize(<<8, 32::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | max_table_names_in_select: value})
    end
    defp(deserialize(<<8, 33::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | max_column_name_length: value})
    end
    defp(deserialize(<<8, 34::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | max_cursor_name_length: value})
    end
    defp(deserialize(<<8, 35::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | max_schema_name_length: value})
    end
    defp(deserialize(<<8, 36::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | max_procedure_name_length: value})
    end
    defp(deserialize(<<8, 37::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | max_catalog_name_length: value})
    end
    defp(deserialize(<<8, 38::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | max_table_name_length: value})
    end
    defp(deserialize(<<8, 39::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | max_user_name_length: value})
    end
    defp(deserialize(<<8, 40::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | default_transaction_isolation: value})
    end
    defp(deserialize(<<3, 41::16-signed, value::8-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | default_result_set_type: value})
    end
    defp(deserialize(<<2, 42::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | default_result_set_holdability_hold_cursors_over_commit: true})
    end
    defp(deserialize(<<2, 42::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | default_result_set_holdability_hold_cursors_over_commit: false})
    end
    defp(deserialize(<<2, 43::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | sql_state_is_x_open: true})
    end
    defp(deserialize(<<2, 43::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | sql_state_is_x_open: false})
    end
    defp(deserialize(<<2, 44::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | catalog_at_start: true})
    end
    defp(deserialize(<<2, 44::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | catalog_at_start: false})
    end
    defp(deserialize(<<13, 45::16-signed, 8, 2, map_size::32-signed, rest::binary>>, struct)) do
      deserialize__transaction_defaults__key(rest, [%{}, map_size, struct])
    end
    defp(deserialize(<<8, 46::16-signed, value::32-signed, rest::binary>>, acc)) do
      deserialize(rest, %{acc | row_id_life_time: value})
    end
    defp(deserialize(<<14, 47::16-signed, 8, remaining::32-signed, rest::binary>>, struct)) do
      deserialize__supported_features(rest, [[], remaining, struct])
    end
    defp(deserialize(<<13, 48::16-signed, 8, 15, map_size::32-signed, rest::binary>>, struct)) do
      deserialize__features_with_params__key(rest, [%{}, map_size, struct])
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    defp(deserialize__date_time_functions(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | date_time_functions: Enum.reverse(list)})
    end
    defp(deserialize__date_time_functions(<<string_size::32-signed, element::binary-size(string_size), rest::binary>>, [list, remaining | stack])) do
      deserialize__date_time_functions(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__date_time_functions(_, _)) do
      :error
    end
    defp(deserialize__features_with_params__key(<<rest::binary>>, [map, 0, struct])) do
      deserialize(rest, %{struct | features_with_params: map})
    end
    defp(deserialize__features_with_params__key(<<key::32-signed, rest::binary>>, stack)) do
      deserialize__features_with_params__value(rest, key, stack)
    end
    defp(deserialize__features_with_params__key(_, _)) do
      :error
    end
    defp(deserialize__features_with_params__value(<<8, remaining::32-signed, rest::binary>>, key, stack)) do
      deserialize__features_with_params__value__element(rest, [[], remaining, key | stack])
    end
    defp(deserialize__features_with_params__value(_, _, _)) do
      :error
    end
    defp(deserialize__features_with_params__value__element(<<rest::binary>>, [value, 0, key, map, remaining | stack])) do
      deserialize__features_with_params__key(rest, [Map.put(map, key, Enum.reverse(value)), remaining - 1 | stack])
    end
    defp(deserialize__features_with_params__value__element(<<element::32-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__features_with_params__value__element(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__features_with_params__value__element(_, _)) do
      :error
    end
    defp(deserialize__numeric_functions(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | numeric_functions: Enum.reverse(list)})
    end
    defp(deserialize__numeric_functions(<<string_size::32-signed, element::binary-size(string_size), rest::binary>>, [list, remaining | stack])) do
      deserialize__numeric_functions(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__numeric_functions(_, _)) do
      :error
    end
    defp(deserialize__sql_keywords(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | sql_keywords: Enum.reverse(list)})
    end
    defp(deserialize__sql_keywords(<<string_size::32-signed, element::binary-size(string_size), rest::binary>>, [list, remaining | stack])) do
      deserialize__sql_keywords(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__sql_keywords(_, _)) do
      :error
    end
    defp(deserialize__string_functions(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | string_functions: Enum.reverse(list)})
    end
    defp(deserialize__string_functions(<<string_size::32-signed, element::binary-size(string_size), rest::binary>>, [list, remaining | stack])) do
      deserialize__string_functions(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__string_functions(_, _)) do
      :error
    end
    defp(deserialize__supported_convert__key(<<rest::binary>>, [map, 0, struct])) do
      deserialize(rest, %{struct | supported_convert: map})
    end
    defp(deserialize__supported_convert__key(<<key::32-signed, rest::binary>>, stack)) do
      deserialize__supported_convert__value(rest, key, stack)
    end
    defp(deserialize__supported_convert__key(_, _)) do
      :error
    end
    defp(deserialize__supported_convert__value(<<8, remaining::32-signed, rest::binary>>, key, stack)) do
      deserialize__supported_convert__value__element(rest, [[], remaining, key | stack])
    end
    defp(deserialize__supported_convert__value(_, _, _)) do
      :error
    end
    defp(deserialize__supported_convert__value__element(<<rest::binary>>, [value, 0, key, map, remaining | stack])) do
      deserialize__supported_convert__key(rest, [Map.put(map, key, MapSet.new(value)), remaining - 1 | stack])
    end
    defp(deserialize__supported_convert__value__element(<<element::32-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__supported_convert__value__element(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__supported_convert__value__element(_, _)) do
      :error
    end
    defp(deserialize__supported_features(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | supported_features: MapSet.new(list)})
    end
    defp(deserialize__supported_features(<<element::32-signed, rest::binary>>, [list, remaining | stack])) do
      deserialize__supported_features(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__supported_features(_, _)) do
      :error
    end
    defp(deserialize__system_functions(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | system_functions: Enum.reverse(list)})
    end
    defp(deserialize__system_functions(<<string_size::32-signed, element::binary-size(string_size), rest::binary>>, [list, remaining | stack])) do
      deserialize__system_functions(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__system_functions(_, _)) do
      :error
    end
    defp(deserialize__transaction_defaults__key(<<rest::binary>>, [map, 0, struct])) do
      deserialize(rest, %{struct | transaction_defaults: map})
    end
    defp(deserialize__transaction_defaults__key(<<key::32-signed, rest::binary>>, stack)) do
      deserialize__transaction_defaults__value(rest, key, stack)
    end
    defp(deserialize__transaction_defaults__key(_, _)) do
      :error
    end
    defp(deserialize__transaction_defaults__value(<<0, rest::binary>>, key, [map, remaining | stack])) do
      deserialize__transaction_defaults__key(rest, [Map.put(map, key, false), remaining - 1 | stack])
    end
    defp(deserialize__transaction_defaults__value(<<1, rest::binary>>, key, [map, remaining | stack])) do
      deserialize__transaction_defaults__key(rest, [Map.put(map, key, true), remaining - 1 | stack])
    end
    defp(deserialize__transaction_defaults__value(_, _, _)) do
      :error
    end
    def(serialize(%Thrift.Generated.ServiceMetaData{product_name: product_name, product_version: product_version, product_major_version: product_major_version, product_minor_version: product_minor_version, jdbc_major_version: jdbc_major_version, jdbc_minor_version: jdbc_minor_version, identifier_quote: identifier_quote, sql_keywords: sql_keywords, numeric_functions: numeric_functions, string_functions: string_functions, system_functions: system_functions, date_time_functions: date_time_functions, search_string_escape: search_string_escape, extra_name_characters: extra_name_characters, supported_convert: supported_convert, schema_term: schema_term, procedure_term: procedure_term, catalog_term: catalog_term, catalog_separator: catalog_separator, max_binary_literal_length: max_binary_literal_length, max_char_literal_length: max_char_literal_length, max_columns_in_group_by: max_columns_in_group_by, max_columns_in_index: max_columns_in_index, max_columns_in_order_by: max_columns_in_order_by, max_columns_in_select: max_columns_in_select, max_columns_in_table: max_columns_in_table, max_connections: max_connections, max_index_length: max_index_length, max_row_size: max_row_size, max_statement_length: max_statement_length, max_open_statements: max_open_statements, max_table_names_in_select: max_table_names_in_select, max_column_name_length: max_column_name_length, max_cursor_name_length: max_cursor_name_length, max_schema_name_length: max_schema_name_length, max_procedure_name_length: max_procedure_name_length, max_catalog_name_length: max_catalog_name_length, max_table_name_length: max_table_name_length, max_user_name_length: max_user_name_length, default_transaction_isolation: default_transaction_isolation, default_result_set_type: default_result_set_type, default_result_set_holdability_hold_cursors_over_commit: default_result_set_holdability_hold_cursors_over_commit, sql_state_is_x_open: sql_state_is_x_open, catalog_at_start: catalog_at_start, transaction_defaults: transaction_defaults, row_id_life_time: row_id_life_time, supported_features: supported_features, features_with_params: features_with_params})) do
      [case(product_name) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :product_name on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          [<<11, 1::16-signed, byte_size(product_name)::32-signed>> | product_name]
      end, case(product_version) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :product_version on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          [<<11, 2::16-signed, byte_size(product_version)::32-signed>> | product_version]
      end, case(product_major_version) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :product_major_version on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          <<8, 3::16-signed, product_major_version::32-signed>>
      end, case(product_minor_version) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :product_minor_version on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          <<8, 4::16-signed, product_minor_version::32-signed>>
      end, case(jdbc_major_version) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :jdbc_major_version on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          <<8, 5::16-signed, jdbc_major_version::32-signed>>
      end, case(jdbc_minor_version) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :jdbc_minor_version on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          <<8, 6::16-signed, jdbc_minor_version::32-signed>>
      end, case(identifier_quote) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :identifier_quote on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          [<<11, 7::16-signed, byte_size(identifier_quote)::32-signed>> | identifier_quote]
      end, case(sql_keywords) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :sql_keywords on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          [<<15, 8::16-signed, 11, length(sql_keywords)::32-signed>> | for(e <- sql_keywords) do
            [<<byte_size(e)::32-signed>> | e]
          end]
      end, case(numeric_functions) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :numeric_functions on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          [<<15, 9::16-signed, 11, length(numeric_functions)::32-signed>> | for(e <- numeric_functions) do
            [<<byte_size(e)::32-signed>> | e]
          end]
      end, case(string_functions) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :string_functions on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          [<<15, 10::16-signed, 11, length(string_functions)::32-signed>> | for(e <- string_functions) do
            [<<byte_size(e)::32-signed>> | e]
          end]
      end, case(system_functions) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :system_functions on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          [<<15, 11::16-signed, 11, length(system_functions)::32-signed>> | for(e <- system_functions) do
            [<<byte_size(e)::32-signed>> | e]
          end]
      end, case(date_time_functions) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :date_time_functions on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          [<<15, 12::16-signed, 11, length(date_time_functions)::32-signed>> | for(e <- date_time_functions) do
            [<<byte_size(e)::32-signed>> | e]
          end]
      end, case(search_string_escape) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :search_string_escape on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          [<<11, 13::16-signed, byte_size(search_string_escape)::32-signed>> | search_string_escape]
      end, case(extra_name_characters) do
        nil ->
          <<>>
        _ ->
          [<<11, 14::16-signed, byte_size(extra_name_characters)::32-signed>> | extra_name_characters]
      end, case(supported_convert) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :supported_convert on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          [<<13, 15::16-signed, 8, 14, Enum.count(supported_convert)::32-signed>> | for({k, v} <- supported_convert) do
            [<<k::32-signed, 8, Enum.count(v)::32-signed>> | for(e <- v) do
              <<e::32-signed>>
            end]
          end]
      end, case(schema_term) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :schema_term on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          [<<11, 16::16-signed, byte_size(schema_term)::32-signed>> | schema_term]
      end, case(procedure_term) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :procedure_term on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          [<<11, 17::16-signed, byte_size(procedure_term)::32-signed>> | procedure_term]
      end, case(catalog_term) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :catalog_term on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          [<<11, 18::16-signed, byte_size(catalog_term)::32-signed>> | catalog_term]
      end, case(catalog_separator) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :catalog_separator on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          [<<11, 19::16-signed, byte_size(catalog_separator)::32-signed>> | catalog_separator]
      end, case(max_binary_literal_length) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :max_binary_literal_length on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          <<8, 20::16-signed, max_binary_literal_length::32-signed>>
      end, case(max_char_literal_length) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :max_char_literal_length on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          <<8, 21::16-signed, max_char_literal_length::32-signed>>
      end, case(max_columns_in_group_by) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :max_columns_in_group_by on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          <<8, 22::16-signed, max_columns_in_group_by::32-signed>>
      end, case(max_columns_in_index) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :max_columns_in_index on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          <<8, 23::16-signed, max_columns_in_index::32-signed>>
      end, case(max_columns_in_order_by) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :max_columns_in_order_by on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          <<8, 24::16-signed, max_columns_in_order_by::32-signed>>
      end, case(max_columns_in_select) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :max_columns_in_select on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          <<8, 25::16-signed, max_columns_in_select::32-signed>>
      end, case(max_columns_in_table) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :max_columns_in_table on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          <<8, 26::16-signed, max_columns_in_table::32-signed>>
      end, case(max_connections) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :max_connections on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          <<8, 27::16-signed, max_connections::32-signed>>
      end, case(max_index_length) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :max_index_length on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          <<8, 28::16-signed, max_index_length::32-signed>>
      end, case(max_row_size) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :max_row_size on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          <<8, 29::16-signed, max_row_size::32-signed>>
      end, case(max_statement_length) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :max_statement_length on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          <<8, 30::16-signed, max_statement_length::32-signed>>
      end, case(max_open_statements) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :max_open_statements on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          <<8, 31::16-signed, max_open_statements::32-signed>>
      end, case(max_table_names_in_select) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :max_table_names_in_select on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          <<8, 32::16-signed, max_table_names_in_select::32-signed>>
      end, case(max_column_name_length) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :max_column_name_length on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          <<8, 33::16-signed, max_column_name_length::32-signed>>
      end, case(max_cursor_name_length) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :max_cursor_name_length on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          <<8, 34::16-signed, max_cursor_name_length::32-signed>>
      end, case(max_schema_name_length) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :max_schema_name_length on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          <<8, 35::16-signed, max_schema_name_length::32-signed>>
      end, case(max_procedure_name_length) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :max_procedure_name_length on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          <<8, 36::16-signed, max_procedure_name_length::32-signed>>
      end, case(max_catalog_name_length) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :max_catalog_name_length on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          <<8, 37::16-signed, max_catalog_name_length::32-signed>>
      end, case(max_table_name_length) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :max_table_name_length on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          <<8, 38::16-signed, max_table_name_length::32-signed>>
      end, case(max_user_name_length) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :max_user_name_length on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          <<8, 39::16-signed, max_user_name_length::32-signed>>
      end, case(default_transaction_isolation) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :default_transaction_isolation on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          <<8, 40::16-signed, default_transaction_isolation::32-signed>>
      end, case(default_result_set_type) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :default_result_set_type on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          <<3, 41::16-signed, default_result_set_type::8-signed>>
      end, case(default_result_set_holdability_hold_cursors_over_commit) do
        false ->
          <<2, 42::16-signed, 0>>
        true ->
          <<2, 42::16-signed, 1>>
        _ ->
          raise(Thrift.InvalidValueException, "Required boolean field :default_result_set_holdability_hold_cursors_over_commit on Thrift.Generated.ServiceMetaData must be true or false")
      end, case(sql_state_is_x_open) do
        false ->
          <<2, 43::16-signed, 0>>
        true ->
          <<2, 43::16-signed, 1>>
        _ ->
          raise(Thrift.InvalidValueException, "Required boolean field :sql_state_is_x_open on Thrift.Generated.ServiceMetaData must be true or false")
      end, case(catalog_at_start) do
        false ->
          <<2, 44::16-signed, 0>>
        true ->
          <<2, 44::16-signed, 1>>
        _ ->
          raise(Thrift.InvalidValueException, "Required boolean field :catalog_at_start on Thrift.Generated.ServiceMetaData must be true or false")
      end, case(transaction_defaults) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :transaction_defaults on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          [<<13, 45::16-signed, 8, 2, Enum.count(transaction_defaults)::32-signed>> | for({k, v} <- transaction_defaults) do
            [<<k::32-signed>> | case(v) do
              nil ->
                <<0>>
              false ->
                <<0>>
              _ ->
                <<1>>
            end]
          end]
      end, case(row_id_life_time) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :row_id_life_time on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          <<8, 46::16-signed, row_id_life_time::32-signed>>
      end, case(supported_features) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :supported_features on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          [<<14, 47::16-signed, 8, Enum.count(supported_features)::32-signed>> | for(e <- supported_features) do
            <<e::32-signed>>
          end]
      end, case(features_with_params) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :features_with_params on Thrift.Generated.ServiceMetaData must not be nil")
        _ ->
          [<<13, 48::16-signed, 8, 15, Enum.count(features_with_params)::32-signed>> | for({k, v} <- features_with_params) do
            [<<k::32-signed, 8, length(v)::32-signed>> | for(e <- v) do
              <<e::32-signed>>
            end]
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