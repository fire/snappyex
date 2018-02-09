defmodule Thrift.Generated.ServiceFeature do
  @moduledoc "Auto-generated Thrift enum snappydata.ServiceFeature"
  defmacro unquote(:all_procedures_callable)() do
    1
  end

  defmacro unquote(:all_tables_selectable)() do
    2
  end

  defmacro unquote(:integrity_enhancement)() do
    3
  end

  defmacro unquote(:nulls_sorted_high)() do
    4
  end

  defmacro unquote(:nulls_sorted_low)() do
    5
  end

  defmacro unquote(:nulls_sorted_start)() do
    6
  end

  defmacro unquote(:nulls_sorted_end)() do
    7
  end

  defmacro unquote(:uses_local_files)() do
    8
  end

  defmacro unquote(:uses_local_file_per_table)() do
    9
  end

  defmacro unquote(:mixedcase_identifiers)() do
    10
  end

  defmacro unquote(:mixedcase_quoted_identifiers)() do
    11
  end

  defmacro unquote(:stores_uppercase_identifiers)() do
    12
  end

  defmacro unquote(:stores_lowercase_identifiers)() do
    13
  end

  defmacro unquote(:stores_mixedcase_identifiers)() do
    14
  end

  defmacro unquote(:stores_uppercase_quoted_identifiers)() do
    15
  end

  defmacro unquote(:stores_lowercase_quoted_identifiers)() do
    16
  end

  defmacro unquote(:stores_mixedcase_quoted_identifiers)() do
    17
  end

  defmacro unquote(:alter_table_add_column)() do
    18
  end

  defmacro unquote(:alter_table_drop_column)() do
    19
  end

  defmacro unquote(:column_aliasing)() do
    20
  end

  defmacro unquote(:null_concat_non_null_is_null)() do
    21
  end

  defmacro unquote(:convert)() do
    22
  end

  defmacro unquote(:table_correlation_names)() do
    23
  end

  defmacro unquote(:table_correlation_names_different)() do
    24
  end

  defmacro unquote(:order_by_expressions)() do
    25
  end

  defmacro unquote(:order_by_unrelated)() do
    26
  end

  defmacro unquote(:group_by)() do
    27
  end

  defmacro unquote(:group_by_unrelated)() do
    28
  end

  defmacro unquote(:group_by_beyond_select)() do
    29
  end

  defmacro unquote(:like_escape)() do
    30
  end

  defmacro unquote(:multiple_resultsets)() do
    31
  end

  defmacro unquote(:multiple_transactions)() do
    32
  end

  defmacro unquote(:non_nullable_columns)() do
    33
  end

  defmacro unquote(:sql_grammar_minimum)() do
    34
  end

  defmacro unquote(:sql_grammar_core)() do
    35
  end

  defmacro unquote(:sql_grammar_extended)() do
    36
  end

  defmacro unquote(:sql_grammar_ansi92_entry)() do
    37
  end

  defmacro unquote(:sql_grammar_ansi92_intermediate)() do
    38
  end

  defmacro unquote(:sql_grammar_ansi92_full)() do
    39
  end

  defmacro unquote(:outer_joins)() do
    40
  end

  defmacro unquote(:outer_joins_full)() do
    41
  end

  defmacro unquote(:outer_joins_limited)() do
    42
  end

  defmacro unquote(:schemas_in_dmls)() do
    43
  end

  defmacro unquote(:schemas_in_procedure_calls)() do
    44
  end

  defmacro unquote(:schemas_in_table_defs)() do
    45
  end

  defmacro unquote(:schemas_in_index_defs)() do
    46
  end

  defmacro unquote(:schemas_in_privilege_defs)() do
    47
  end

  defmacro unquote(:autocommit_failure_closes_all_resultsets)() do
    48
  end

  defmacro unquote(:catalogs_in_dmls)() do
    49
  end

  defmacro unquote(:catalogs_in_procedure_calls)() do
    50
  end

  defmacro unquote(:catalogs_in_table_defs)() do
    51
  end

  defmacro unquote(:catalogs_in_index_defs)() do
    52
  end

  defmacro unquote(:catalogs_in_privilege_defs)() do
    53
  end

  defmacro unquote(:positioned_delete)() do
    54
  end

  defmacro unquote(:positioned_update)() do
    55
  end

  defmacro unquote(:select_for_update)() do
    56
  end

  defmacro unquote(:stored_procedures)() do
    57
  end

  defmacro unquote(:subqueries_in_comparisons)() do
    58
  end

  defmacro unquote(:subqueries_in_exists)() do
    59
  end

  defmacro unquote(:subqueries_in_ins)() do
    60
  end

  defmacro unquote(:subqueries_in_quantifieds)() do
    61
  end

  defmacro unquote(:subqueries_correlated)() do
    62
  end

  defmacro unquote(:union)() do
    63
  end

  defmacro unquote(:union_all)() do
    64
  end

  defmacro unquote(:open_cursors_across_commit)() do
    65
  end

  defmacro unquote(:open_cursors_across_rollback)() do
    66
  end

  defmacro unquote(:open_statements_across_commit)() do
    67
  end

  defmacro unquote(:open_statements_across_rollback)() do
    68
  end

  defmacro unquote(:max_rowsize_includes_blobsize)() do
    69
  end

  defmacro unquote(:transactions)() do
    70
  end

  defmacro unquote(:transactions_both_dmls_and_ddls)() do
    71
  end

  defmacro unquote(:transactions_dmls_only)() do
    72
  end

  defmacro unquote(:transactions_ddls_implicit_commit)() do
    73
  end

  defmacro unquote(:transactions_ddls_ignored)() do
    74
  end

  defmacro unquote(:transactions_savepoints)() do
    75
  end

  defmacro unquote(:callable_named_parameters)() do
    76
  end

  defmacro unquote(:callable_multiple_open_resultsets)() do
    77
  end

  defmacro unquote(:generated_keys_retrieval)() do
    78
  end

  defmacro unquote(:generated_keys_always_returned)() do
    79
  end

  defmacro unquote(:batch_updates)() do
    80
  end

  defmacro unquote(:resultset_forward_only)() do
    81
  end

  defmacro unquote(:resultset_scroll_insensitive)() do
    82
  end

  defmacro unquote(:resultset_scroll_sensitive)() do
    83
  end

  defmacro unquote(:resultset_holdability_close_cursors_at_commit)() do
    84
  end

  defmacro unquote(:resultset_holdability_hold_cursors_over_commit)() do
    85
  end

  defmacro unquote(:lob_updates_copy)() do
    86
  end

  defmacro unquote(:statement_pooling)() do
    87
  end

  defmacro unquote(:stored_functions_using_call)() do
    88
  end

  def value_to_name(1) do
    {:ok, :all_procedures_callable}
  end

  def value_to_name(2) do
    {:ok, :all_tables_selectable}
  end

  def value_to_name(3) do
    {:ok, :integrity_enhancement}
  end

  def value_to_name(4) do
    {:ok, :nulls_sorted_high}
  end

  def value_to_name(5) do
    {:ok, :nulls_sorted_low}
  end

  def value_to_name(6) do
    {:ok, :nulls_sorted_start}
  end

  def value_to_name(7) do
    {:ok, :nulls_sorted_end}
  end

  def value_to_name(8) do
    {:ok, :uses_local_files}
  end

  def value_to_name(9) do
    {:ok, :uses_local_file_per_table}
  end

  def value_to_name(10) do
    {:ok, :mixedcase_identifiers}
  end

  def value_to_name(11) do
    {:ok, :mixedcase_quoted_identifiers}
  end

  def value_to_name(12) do
    {:ok, :stores_uppercase_identifiers}
  end

  def value_to_name(13) do
    {:ok, :stores_lowercase_identifiers}
  end

  def value_to_name(14) do
    {:ok, :stores_mixedcase_identifiers}
  end

  def value_to_name(15) do
    {:ok, :stores_uppercase_quoted_identifiers}
  end

  def value_to_name(16) do
    {:ok, :stores_lowercase_quoted_identifiers}
  end

  def value_to_name(17) do
    {:ok, :stores_mixedcase_quoted_identifiers}
  end

  def value_to_name(18) do
    {:ok, :alter_table_add_column}
  end

  def value_to_name(19) do
    {:ok, :alter_table_drop_column}
  end

  def value_to_name(20) do
    {:ok, :column_aliasing}
  end

  def value_to_name(21) do
    {:ok, :null_concat_non_null_is_null}
  end

  def value_to_name(22) do
    {:ok, :convert}
  end

  def value_to_name(23) do
    {:ok, :table_correlation_names}
  end

  def value_to_name(24) do
    {:ok, :table_correlation_names_different}
  end

  def value_to_name(25) do
    {:ok, :order_by_expressions}
  end

  def value_to_name(26) do
    {:ok, :order_by_unrelated}
  end

  def value_to_name(27) do
    {:ok, :group_by}
  end

  def value_to_name(28) do
    {:ok, :group_by_unrelated}
  end

  def value_to_name(29) do
    {:ok, :group_by_beyond_select}
  end

  def value_to_name(30) do
    {:ok, :like_escape}
  end

  def value_to_name(31) do
    {:ok, :multiple_resultsets}
  end

  def value_to_name(32) do
    {:ok, :multiple_transactions}
  end

  def value_to_name(33) do
    {:ok, :non_nullable_columns}
  end

  def value_to_name(34) do
    {:ok, :sql_grammar_minimum}
  end

  def value_to_name(35) do
    {:ok, :sql_grammar_core}
  end

  def value_to_name(36) do
    {:ok, :sql_grammar_extended}
  end

  def value_to_name(37) do
    {:ok, :sql_grammar_ansi92_entry}
  end

  def value_to_name(38) do
    {:ok, :sql_grammar_ansi92_intermediate}
  end

  def value_to_name(39) do
    {:ok, :sql_grammar_ansi92_full}
  end

  def value_to_name(40) do
    {:ok, :outer_joins}
  end

  def value_to_name(41) do
    {:ok, :outer_joins_full}
  end

  def value_to_name(42) do
    {:ok, :outer_joins_limited}
  end

  def value_to_name(43) do
    {:ok, :schemas_in_dmls}
  end

  def value_to_name(44) do
    {:ok, :schemas_in_procedure_calls}
  end

  def value_to_name(45) do
    {:ok, :schemas_in_table_defs}
  end

  def value_to_name(46) do
    {:ok, :schemas_in_index_defs}
  end

  def value_to_name(47) do
    {:ok, :schemas_in_privilege_defs}
  end

  def value_to_name(48) do
    {:ok, :autocommit_failure_closes_all_resultsets}
  end

  def value_to_name(49) do
    {:ok, :catalogs_in_dmls}
  end

  def value_to_name(50) do
    {:ok, :catalogs_in_procedure_calls}
  end

  def value_to_name(51) do
    {:ok, :catalogs_in_table_defs}
  end

  def value_to_name(52) do
    {:ok, :catalogs_in_index_defs}
  end

  def value_to_name(53) do
    {:ok, :catalogs_in_privilege_defs}
  end

  def value_to_name(54) do
    {:ok, :positioned_delete}
  end

  def value_to_name(55) do
    {:ok, :positioned_update}
  end

  def value_to_name(56) do
    {:ok, :select_for_update}
  end

  def value_to_name(57) do
    {:ok, :stored_procedures}
  end

  def value_to_name(58) do
    {:ok, :subqueries_in_comparisons}
  end

  def value_to_name(59) do
    {:ok, :subqueries_in_exists}
  end

  def value_to_name(60) do
    {:ok, :subqueries_in_ins}
  end

  def value_to_name(61) do
    {:ok, :subqueries_in_quantifieds}
  end

  def value_to_name(62) do
    {:ok, :subqueries_correlated}
  end

  def value_to_name(63) do
    {:ok, :union}
  end

  def value_to_name(64) do
    {:ok, :union_all}
  end

  def value_to_name(65) do
    {:ok, :open_cursors_across_commit}
  end

  def value_to_name(66) do
    {:ok, :open_cursors_across_rollback}
  end

  def value_to_name(67) do
    {:ok, :open_statements_across_commit}
  end

  def value_to_name(68) do
    {:ok, :open_statements_across_rollback}
  end

  def value_to_name(69) do
    {:ok, :max_rowsize_includes_blobsize}
  end

  def value_to_name(70) do
    {:ok, :transactions}
  end

  def value_to_name(71) do
    {:ok, :transactions_both_dmls_and_ddls}
  end

  def value_to_name(72) do
    {:ok, :transactions_dmls_only}
  end

  def value_to_name(73) do
    {:ok, :transactions_ddls_implicit_commit}
  end

  def value_to_name(74) do
    {:ok, :transactions_ddls_ignored}
  end

  def value_to_name(75) do
    {:ok, :transactions_savepoints}
  end

  def value_to_name(76) do
    {:ok, :callable_named_parameters}
  end

  def value_to_name(77) do
    {:ok, :callable_multiple_open_resultsets}
  end

  def value_to_name(78) do
    {:ok, :generated_keys_retrieval}
  end

  def value_to_name(79) do
    {:ok, :generated_keys_always_returned}
  end

  def value_to_name(80) do
    {:ok, :batch_updates}
  end

  def value_to_name(81) do
    {:ok, :resultset_forward_only}
  end

  def value_to_name(82) do
    {:ok, :resultset_scroll_insensitive}
  end

  def value_to_name(83) do
    {:ok, :resultset_scroll_sensitive}
  end

  def value_to_name(84) do
    {:ok, :resultset_holdability_close_cursors_at_commit}
  end

  def value_to_name(85) do
    {:ok, :resultset_holdability_hold_cursors_over_commit}
  end

  def value_to_name(86) do
    {:ok, :lob_updates_copy}
  end

  def value_to_name(87) do
    {:ok, :statement_pooling}
  end

  def value_to_name(88) do
    {:ok, :stored_functions_using_call}
  end

  def value_to_name(v) do
    {:error, {:invalid_enum_value, v}}
  end

  def name_to_value(:all_procedures_callable) do
    {:ok, 1}
  end

  def name_to_value(:all_tables_selectable) do
    {:ok, 2}
  end

  def name_to_value(:integrity_enhancement) do
    {:ok, 3}
  end

  def name_to_value(:nulls_sorted_high) do
    {:ok, 4}
  end

  def name_to_value(:nulls_sorted_low) do
    {:ok, 5}
  end

  def name_to_value(:nulls_sorted_start) do
    {:ok, 6}
  end

  def name_to_value(:nulls_sorted_end) do
    {:ok, 7}
  end

  def name_to_value(:uses_local_files) do
    {:ok, 8}
  end

  def name_to_value(:uses_local_file_per_table) do
    {:ok, 9}
  end

  def name_to_value(:mixedcase_identifiers) do
    {:ok, 10}
  end

  def name_to_value(:mixedcase_quoted_identifiers) do
    {:ok, 11}
  end

  def name_to_value(:stores_uppercase_identifiers) do
    {:ok, 12}
  end

  def name_to_value(:stores_lowercase_identifiers) do
    {:ok, 13}
  end

  def name_to_value(:stores_mixedcase_identifiers) do
    {:ok, 14}
  end

  def name_to_value(:stores_uppercase_quoted_identifiers) do
    {:ok, 15}
  end

  def name_to_value(:stores_lowercase_quoted_identifiers) do
    {:ok, 16}
  end

  def name_to_value(:stores_mixedcase_quoted_identifiers) do
    {:ok, 17}
  end

  def name_to_value(:alter_table_add_column) do
    {:ok, 18}
  end

  def name_to_value(:alter_table_drop_column) do
    {:ok, 19}
  end

  def name_to_value(:column_aliasing) do
    {:ok, 20}
  end

  def name_to_value(:null_concat_non_null_is_null) do
    {:ok, 21}
  end

  def name_to_value(:convert) do
    {:ok, 22}
  end

  def name_to_value(:table_correlation_names) do
    {:ok, 23}
  end

  def name_to_value(:table_correlation_names_different) do
    {:ok, 24}
  end

  def name_to_value(:order_by_expressions) do
    {:ok, 25}
  end

  def name_to_value(:order_by_unrelated) do
    {:ok, 26}
  end

  def name_to_value(:group_by) do
    {:ok, 27}
  end

  def name_to_value(:group_by_unrelated) do
    {:ok, 28}
  end

  def name_to_value(:group_by_beyond_select) do
    {:ok, 29}
  end

  def name_to_value(:like_escape) do
    {:ok, 30}
  end

  def name_to_value(:multiple_resultsets) do
    {:ok, 31}
  end

  def name_to_value(:multiple_transactions) do
    {:ok, 32}
  end

  def name_to_value(:non_nullable_columns) do
    {:ok, 33}
  end

  def name_to_value(:sql_grammar_minimum) do
    {:ok, 34}
  end

  def name_to_value(:sql_grammar_core) do
    {:ok, 35}
  end

  def name_to_value(:sql_grammar_extended) do
    {:ok, 36}
  end

  def name_to_value(:sql_grammar_ansi92_entry) do
    {:ok, 37}
  end

  def name_to_value(:sql_grammar_ansi92_intermediate) do
    {:ok, 38}
  end

  def name_to_value(:sql_grammar_ansi92_full) do
    {:ok, 39}
  end

  def name_to_value(:outer_joins) do
    {:ok, 40}
  end

  def name_to_value(:outer_joins_full) do
    {:ok, 41}
  end

  def name_to_value(:outer_joins_limited) do
    {:ok, 42}
  end

  def name_to_value(:schemas_in_dmls) do
    {:ok, 43}
  end

  def name_to_value(:schemas_in_procedure_calls) do
    {:ok, 44}
  end

  def name_to_value(:schemas_in_table_defs) do
    {:ok, 45}
  end

  def name_to_value(:schemas_in_index_defs) do
    {:ok, 46}
  end

  def name_to_value(:schemas_in_privilege_defs) do
    {:ok, 47}
  end

  def name_to_value(:autocommit_failure_closes_all_resultsets) do
    {:ok, 48}
  end

  def name_to_value(:catalogs_in_dmls) do
    {:ok, 49}
  end

  def name_to_value(:catalogs_in_procedure_calls) do
    {:ok, 50}
  end

  def name_to_value(:catalogs_in_table_defs) do
    {:ok, 51}
  end

  def name_to_value(:catalogs_in_index_defs) do
    {:ok, 52}
  end

  def name_to_value(:catalogs_in_privilege_defs) do
    {:ok, 53}
  end

  def name_to_value(:positioned_delete) do
    {:ok, 54}
  end

  def name_to_value(:positioned_update) do
    {:ok, 55}
  end

  def name_to_value(:select_for_update) do
    {:ok, 56}
  end

  def name_to_value(:stored_procedures) do
    {:ok, 57}
  end

  def name_to_value(:subqueries_in_comparisons) do
    {:ok, 58}
  end

  def name_to_value(:subqueries_in_exists) do
    {:ok, 59}
  end

  def name_to_value(:subqueries_in_ins) do
    {:ok, 60}
  end

  def name_to_value(:subqueries_in_quantifieds) do
    {:ok, 61}
  end

  def name_to_value(:subqueries_correlated) do
    {:ok, 62}
  end

  def name_to_value(:union) do
    {:ok, 63}
  end

  def name_to_value(:union_all) do
    {:ok, 64}
  end

  def name_to_value(:open_cursors_across_commit) do
    {:ok, 65}
  end

  def name_to_value(:open_cursors_across_rollback) do
    {:ok, 66}
  end

  def name_to_value(:open_statements_across_commit) do
    {:ok, 67}
  end

  def name_to_value(:open_statements_across_rollback) do
    {:ok, 68}
  end

  def name_to_value(:max_rowsize_includes_blobsize) do
    {:ok, 69}
  end

  def name_to_value(:transactions) do
    {:ok, 70}
  end

  def name_to_value(:transactions_both_dmls_and_ddls) do
    {:ok, 71}
  end

  def name_to_value(:transactions_dmls_only) do
    {:ok, 72}
  end

  def name_to_value(:transactions_ddls_implicit_commit) do
    {:ok, 73}
  end

  def name_to_value(:transactions_ddls_ignored) do
    {:ok, 74}
  end

  def name_to_value(:transactions_savepoints) do
    {:ok, 75}
  end

  def name_to_value(:callable_named_parameters) do
    {:ok, 76}
  end

  def name_to_value(:callable_multiple_open_resultsets) do
    {:ok, 77}
  end

  def name_to_value(:generated_keys_retrieval) do
    {:ok, 78}
  end

  def name_to_value(:generated_keys_always_returned) do
    {:ok, 79}
  end

  def name_to_value(:batch_updates) do
    {:ok, 80}
  end

  def name_to_value(:resultset_forward_only) do
    {:ok, 81}
  end

  def name_to_value(:resultset_scroll_insensitive) do
    {:ok, 82}
  end

  def name_to_value(:resultset_scroll_sensitive) do
    {:ok, 83}
  end

  def name_to_value(:resultset_holdability_close_cursors_at_commit) do
    {:ok, 84}
  end

  def name_to_value(:resultset_holdability_hold_cursors_over_commit) do
    {:ok, 85}
  end

  def name_to_value(:lob_updates_copy) do
    {:ok, 86}
  end

  def name_to_value(:statement_pooling) do
    {:ok, 87}
  end

  def name_to_value(:stored_functions_using_call) do
    {:ok, 88}
  end

  def name_to_value(k) do
    {:error, {:invalid_enum_name, k}}
  end

  def value_to_name!(value) do
    {:ok, name} = value_to_name(value)
    name
  end

  def name_to_value!(name) do
    {:ok, value} = name_to_value(name)
    value
  end

  def meta(:names) do
    [
      :all_procedures_callable,
      :all_tables_selectable,
      :integrity_enhancement,
      :nulls_sorted_high,
      :nulls_sorted_low,
      :nulls_sorted_start,
      :nulls_sorted_end,
      :uses_local_files,
      :uses_local_file_per_table,
      :mixedcase_identifiers,
      :mixedcase_quoted_identifiers,
      :stores_uppercase_identifiers,
      :stores_lowercase_identifiers,
      :stores_mixedcase_identifiers,
      :stores_uppercase_quoted_identifiers,
      :stores_lowercase_quoted_identifiers,
      :stores_mixedcase_quoted_identifiers,
      :alter_table_add_column,
      :alter_table_drop_column,
      :column_aliasing,
      :null_concat_non_null_is_null,
      :convert,
      :table_correlation_names,
      :table_correlation_names_different,
      :order_by_expressions,
      :order_by_unrelated,
      :group_by,
      :group_by_unrelated,
      :group_by_beyond_select,
      :like_escape,
      :multiple_resultsets,
      :multiple_transactions,
      :non_nullable_columns,
      :sql_grammar_minimum,
      :sql_grammar_core,
      :sql_grammar_extended,
      :sql_grammar_ansi92_entry,
      :sql_grammar_ansi92_intermediate,
      :sql_grammar_ansi92_full,
      :outer_joins,
      :outer_joins_full,
      :outer_joins_limited,
      :schemas_in_dmls,
      :schemas_in_procedure_calls,
      :schemas_in_table_defs,
      :schemas_in_index_defs,
      :schemas_in_privilege_defs,
      :autocommit_failure_closes_all_resultsets,
      :catalogs_in_dmls,
      :catalogs_in_procedure_calls,
      :catalogs_in_table_defs,
      :catalogs_in_index_defs,
      :catalogs_in_privilege_defs,
      :positioned_delete,
      :positioned_update,
      :select_for_update,
      :stored_procedures,
      :subqueries_in_comparisons,
      :subqueries_in_exists,
      :subqueries_in_ins,
      :subqueries_in_quantifieds,
      :subqueries_correlated,
      :union,
      :union_all,
      :open_cursors_across_commit,
      :open_cursors_across_rollback,
      :open_statements_across_commit,
      :open_statements_across_rollback,
      :max_rowsize_includes_blobsize,
      :transactions,
      :transactions_both_dmls_and_ddls,
      :transactions_dmls_only,
      :transactions_ddls_implicit_commit,
      :transactions_ddls_ignored,
      :transactions_savepoints,
      :callable_named_parameters,
      :callable_multiple_open_resultsets,
      :generated_keys_retrieval,
      :generated_keys_always_returned,
      :batch_updates,
      :resultset_forward_only,
      :resultset_scroll_insensitive,
      :resultset_scroll_sensitive,
      :resultset_holdability_close_cursors_at_commit,
      :resultset_holdability_hold_cursors_over_commit,
      :lob_updates_copy,
      :statement_pooling,
      :stored_functions_using_call
    ]
  end

  def meta(:values) do
    [
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20,
      21,
      22,
      23,
      24,
      25,
      26,
      27,
      28,
      29,
      30,
      31,
      32,
      33,
      34,
      35,
      36,
      37,
      38,
      39,
      40,
      41,
      42,
      43,
      44,
      45,
      46,
      47,
      48,
      49,
      50,
      51,
      52,
      53,
      54,
      55,
      56,
      57,
      58,
      59,
      60,
      61,
      62,
      63,
      64,
      65,
      66,
      67,
      68,
      69,
      70,
      71,
      72,
      73,
      74,
      75,
      76,
      77,
      78,
      79,
      80,
      81,
      82,
      83,
      84,
      85,
      86,
      87,
      88
    ]
  end

  def member?(1) do
    true
  end

  def member?(2) do
    true
  end

  def member?(3) do
    true
  end

  def member?(4) do
    true
  end

  def member?(5) do
    true
  end

  def member?(6) do
    true
  end

  def member?(7) do
    true
  end

  def member?(8) do
    true
  end

  def member?(9) do
    true
  end

  def member?(10) do
    true
  end

  def member?(11) do
    true
  end

  def member?(12) do
    true
  end

  def member?(13) do
    true
  end

  def member?(14) do
    true
  end

  def member?(15) do
    true
  end

  def member?(16) do
    true
  end

  def member?(17) do
    true
  end

  def member?(18) do
    true
  end

  def member?(19) do
    true
  end

  def member?(20) do
    true
  end

  def member?(21) do
    true
  end

  def member?(22) do
    true
  end

  def member?(23) do
    true
  end

  def member?(24) do
    true
  end

  def member?(25) do
    true
  end

  def member?(26) do
    true
  end

  def member?(27) do
    true
  end

  def member?(28) do
    true
  end

  def member?(29) do
    true
  end

  def member?(30) do
    true
  end

  def member?(31) do
    true
  end

  def member?(32) do
    true
  end

  def member?(33) do
    true
  end

  def member?(34) do
    true
  end

  def member?(35) do
    true
  end

  def member?(36) do
    true
  end

  def member?(37) do
    true
  end

  def member?(38) do
    true
  end

  def member?(39) do
    true
  end

  def member?(40) do
    true
  end

  def member?(41) do
    true
  end

  def member?(42) do
    true
  end

  def member?(43) do
    true
  end

  def member?(44) do
    true
  end

  def member?(45) do
    true
  end

  def member?(46) do
    true
  end

  def member?(47) do
    true
  end

  def member?(48) do
    true
  end

  def member?(49) do
    true
  end

  def member?(50) do
    true
  end

  def member?(51) do
    true
  end

  def member?(52) do
    true
  end

  def member?(53) do
    true
  end

  def member?(54) do
    true
  end

  def member?(55) do
    true
  end

  def member?(56) do
    true
  end

  def member?(57) do
    true
  end

  def member?(58) do
    true
  end

  def member?(59) do
    true
  end

  def member?(60) do
    true
  end

  def member?(61) do
    true
  end

  def member?(62) do
    true
  end

  def member?(63) do
    true
  end

  def member?(64) do
    true
  end

  def member?(65) do
    true
  end

  def member?(66) do
    true
  end

  def member?(67) do
    true
  end

  def member?(68) do
    true
  end

  def member?(69) do
    true
  end

  def member?(70) do
    true
  end

  def member?(71) do
    true
  end

  def member?(72) do
    true
  end

  def member?(73) do
    true
  end

  def member?(74) do
    true
  end

  def member?(75) do
    true
  end

  def member?(76) do
    true
  end

  def member?(77) do
    true
  end

  def member?(78) do
    true
  end

  def member?(79) do
    true
  end

  def member?(80) do
    true
  end

  def member?(81) do
    true
  end

  def member?(82) do
    true
  end

  def member?(83) do
    true
  end

  def member?(84) do
    true
  end

  def member?(85) do
    true
  end

  def member?(86) do
    true
  end

  def member?(87) do
    true
  end

  def member?(88) do
    true
  end

  def member?(_) do
    false
  end

  def name?(:all_procedures_callable) do
    true
  end

  def name?(:all_tables_selectable) do
    true
  end

  def name?(:integrity_enhancement) do
    true
  end

  def name?(:nulls_sorted_high) do
    true
  end

  def name?(:nulls_sorted_low) do
    true
  end

  def name?(:nulls_sorted_start) do
    true
  end

  def name?(:nulls_sorted_end) do
    true
  end

  def name?(:uses_local_files) do
    true
  end

  def name?(:uses_local_file_per_table) do
    true
  end

  def name?(:mixedcase_identifiers) do
    true
  end

  def name?(:mixedcase_quoted_identifiers) do
    true
  end

  def name?(:stores_uppercase_identifiers) do
    true
  end

  def name?(:stores_lowercase_identifiers) do
    true
  end

  def name?(:stores_mixedcase_identifiers) do
    true
  end

  def name?(:stores_uppercase_quoted_identifiers) do
    true
  end

  def name?(:stores_lowercase_quoted_identifiers) do
    true
  end

  def name?(:stores_mixedcase_quoted_identifiers) do
    true
  end

  def name?(:alter_table_add_column) do
    true
  end

  def name?(:alter_table_drop_column) do
    true
  end

  def name?(:column_aliasing) do
    true
  end

  def name?(:null_concat_non_null_is_null) do
    true
  end

  def name?(:convert) do
    true
  end

  def name?(:table_correlation_names) do
    true
  end

  def name?(:table_correlation_names_different) do
    true
  end

  def name?(:order_by_expressions) do
    true
  end

  def name?(:order_by_unrelated) do
    true
  end

  def name?(:group_by) do
    true
  end

  def name?(:group_by_unrelated) do
    true
  end

  def name?(:group_by_beyond_select) do
    true
  end

  def name?(:like_escape) do
    true
  end

  def name?(:multiple_resultsets) do
    true
  end

  def name?(:multiple_transactions) do
    true
  end

  def name?(:non_nullable_columns) do
    true
  end

  def name?(:sql_grammar_minimum) do
    true
  end

  def name?(:sql_grammar_core) do
    true
  end

  def name?(:sql_grammar_extended) do
    true
  end

  def name?(:sql_grammar_ansi92_entry) do
    true
  end

  def name?(:sql_grammar_ansi92_intermediate) do
    true
  end

  def name?(:sql_grammar_ansi92_full) do
    true
  end

  def name?(:outer_joins) do
    true
  end

  def name?(:outer_joins_full) do
    true
  end

  def name?(:outer_joins_limited) do
    true
  end

  def name?(:schemas_in_dmls) do
    true
  end

  def name?(:schemas_in_procedure_calls) do
    true
  end

  def name?(:schemas_in_table_defs) do
    true
  end

  def name?(:schemas_in_index_defs) do
    true
  end

  def name?(:schemas_in_privilege_defs) do
    true
  end

  def name?(:autocommit_failure_closes_all_resultsets) do
    true
  end

  def name?(:catalogs_in_dmls) do
    true
  end

  def name?(:catalogs_in_procedure_calls) do
    true
  end

  def name?(:catalogs_in_table_defs) do
    true
  end

  def name?(:catalogs_in_index_defs) do
    true
  end

  def name?(:catalogs_in_privilege_defs) do
    true
  end

  def name?(:positioned_delete) do
    true
  end

  def name?(:positioned_update) do
    true
  end

  def name?(:select_for_update) do
    true
  end

  def name?(:stored_procedures) do
    true
  end

  def name?(:subqueries_in_comparisons) do
    true
  end

  def name?(:subqueries_in_exists) do
    true
  end

  def name?(:subqueries_in_ins) do
    true
  end

  def name?(:subqueries_in_quantifieds) do
    true
  end

  def name?(:subqueries_correlated) do
    true
  end

  def name?(:union) do
    true
  end

  def name?(:union_all) do
    true
  end

  def name?(:open_cursors_across_commit) do
    true
  end

  def name?(:open_cursors_across_rollback) do
    true
  end

  def name?(:open_statements_across_commit) do
    true
  end

  def name?(:open_statements_across_rollback) do
    true
  end

  def name?(:max_rowsize_includes_blobsize) do
    true
  end

  def name?(:transactions) do
    true
  end

  def name?(:transactions_both_dmls_and_ddls) do
    true
  end

  def name?(:transactions_dmls_only) do
    true
  end

  def name?(:transactions_ddls_implicit_commit) do
    true
  end

  def name?(:transactions_ddls_ignored) do
    true
  end

  def name?(:transactions_savepoints) do
    true
  end

  def name?(:callable_named_parameters) do
    true
  end

  def name?(:callable_multiple_open_resultsets) do
    true
  end

  def name?(:generated_keys_retrieval) do
    true
  end

  def name?(:generated_keys_always_returned) do
    true
  end

  def name?(:batch_updates) do
    true
  end

  def name?(:resultset_forward_only) do
    true
  end

  def name?(:resultset_scroll_insensitive) do
    true
  end

  def name?(:resultset_scroll_sensitive) do
    true
  end

  def name?(:resultset_holdability_close_cursors_at_commit) do
    true
  end

  def name?(:resultset_holdability_hold_cursors_over_commit) do
    true
  end

  def name?(:lob_updates_copy) do
    true
  end

  def name?(:statement_pooling) do
    true
  end

  def name?(:stored_functions_using_call) do
    true
  end

  def name?(_) do
    false
  end
end
