defmodule(SnappyData.Thrift.Snappydata) do
  defmacro(invalid_id) do
    Macro.escape(0)
  end
  defmacro(statement_type_ddl) do
    Macro.escape(5)
  end
  defmacro(nextrs_keep_current_result) do
    Macro.escape(1)
  end
  defmacro(xa_tmnoflags) do
    Macro.escape(0)
  end
  defmacro(xa_tmsuccess) do
    Macro.escape(67108864)
  end
  defmacro(rowset_has_more_rowsets) do
    Macro.escape(2)
  end
  defmacro(default_autocommit) do
    Macro.escape(false)
  end
  defmacro(rowset_last_batch) do
    Macro.escape(1)
  end
  defmacro(resultset_type_sensitive) do
    Macro.escape(3)
  end
  defmacro(xa_tmresume) do
    Macro.escape(134217728)
  end
  defmacro(default_session_token_size) do
    Macro.escape(16)
  end
  defmacro(decimal_max_precision) do
    Macro.escape(127)
  end
  defmacro(default_lob_chunksize) do
    Macro.escape(2097152)
  end
  defmacro(statement_type_select) do
    Macro.escape(0)
  end
  defmacro(transaction_read_uncommitted) do
    Macro.escape(1)
  end
  defmacro(nextrs_close_current_result) do
    Macro.escape(2)
  end
  defmacro(xa_tmonephase) do
    Macro.escape(1073741824)
  end
  defmacro(transaction_no_change) do
    Macro.escape(64)
  end
  defmacro(resultset_type_unknown) do
    Macro.escape(4)
  end
  defmacro(bulk_close_lob) do
    Macro.escape(2)
  end
  defmacro(default_resultset_updatable) do
    Macro.escape(false)
  end
  defmacro(resultset_type_forward_only) do
    Macro.escape(1)
  end
  defmacro(default_resultset_hold_cursors_over_commit) do
    Macro.escape(false)
  end
  defmacro(rowset_after_last) do
    Macro.escape(8)
  end
  defmacro(bulk_close_statement) do
    Macro.escape(3)
  end
  defmacro(default_resultset_batchsize) do
    Macro.escape(1024)
  end
  defmacro(bulk_close_resultset) do
    Macro.escape(1)
  end
  defmacro(xa_ok) do
    Macro.escape(0)
  end
  defmacro(bulk_close_connection) do
    Macro.escape(4)
  end
  defmacro(statement_type_update) do
    Macro.escape(2)
  end
  defmacro(column_scale_unknown) do
    Macro.escape(0)
  end
  defmacro(transaction_serializable) do
    Macro.escape(8)
  end
  defmacro(xa_tmendrscan) do
    Macro.escape(8388608)
  end
  defmacro(xa_tmstartrscan) do
    Macro.escape(16777216)
  end
  defmacro(column_precision_unknown) do
    Macro.escape(0)
  end
  defmacro(default_resultset_type) do
    Macro.escape(1)
  end
  defmacro(statement_type_delete) do
    Macro.escape(3)
  end
  defmacro(resultset_type_insensitive) do
    Macro.escape(2)
  end
  defmacro(xa_tmfail) do
    Macro.escape(536870912)
  end
  defmacro(transaction_read_committed) do
    Macro.escape(2)
  end
  defmacro(rowset_before_first) do
    Macro.escape(4)
  end
  defmacro(driver_jdbc) do
    Macro.escape(1)
  end
  defmacro(default_transaction_isolation) do
    Macro.escape(0)
  end
  defmacro(xa_rdonly) do
    Macro.escape(3)
  end
  defmacro(xa_tmjoin) do
    Macro.escape(2097152)
  end
  defmacro(tmsuspend) do
    Macro.escape(33554432)
  end
  defmacro(driver_odbc) do
    Macro.escape(2)
  end
  defmacro(statement_type_insert) do
    Macro.escape(1)
  end
  defmacro(nextrs_close_all_results) do
    Macro.escape(0)
  end
  defmacro(statement_type_call) do
    Macro.escape(4)
  end
  defmacro(transaction_none) do
    Macro.escape(0)
  end
  defmacro(transaction_repeatable_read) do
    Macro.escape(4)
  end
end