defmodule(SnappyData.Thrift.SnappyDataService.Handler) do
  @callback(get_service_meta_data(conn_id :: Thrift.i64(), token :: binary) :: %SnappyData.Thrift.ServiceMetaData{})
  @callback(get_clob_chunk(conn_id :: Thrift.i64(), lob_id :: Thrift.i64(), offset :: Thrift.i64(), size :: Thrift.i32(), free_lob_at_end :: boolean(), token :: binary) :: %SnappyData.Thrift.ClobChunk{})
  @callback(cancel_statement(stmt_id :: Thrift.i64(), token :: binary) :: no_return())
  @callback(prepare_statement(conn_id :: Thrift.i64(), sql :: String.t(), output_params :: %{Thrift.i32() => %SnappyData.Thrift.OutputParameter{}}, attrs :: %SnappyData.Thrift.StatementAttrs{}, token :: binary) :: %SnappyData.Thrift.PrepareResult{})
  @callback(get_best_row_identifier(metadata_args :: %SnappyData.Thrift.ServiceMetaDataArgs{}, scope :: Thrift.i32(), nullable :: boolean()) :: %SnappyData.Thrift.RowSet{})
  @callback(commit_xa_transaction(conn_id :: Thrift.i64(), xid :: %SnappyData.Thrift.TransactionXid{}, one_phase :: boolean(), token :: binary) :: no_return())
  @callback(begin_transaction(conn_id :: Thrift.i64(), isolation_level :: Thrift.i8(), flags :: %{non_neg_integer => boolean()}, token :: binary) :: Thrift.i8())
  @callback(prepare_and_execute(conn_id :: Thrift.i64(), sql :: String.t(), params_batch :: [%SnappyData.Thrift.Row{}], output_params :: %{Thrift.i32() => %SnappyData.Thrift.OutputParameter{}}, attrs :: %SnappyData.Thrift.StatementAttrs{}, token :: binary) :: %SnappyData.Thrift.StatementResult{})
  @callback(fetch_active_connections(conn_id :: Thrift.i64(), token :: binary) :: [%SnappyData.Thrift.ConnectionProperties{}])
  @callback(rollback_xa_transaction(conn_id :: Thrift.i64(), xid :: %SnappyData.Thrift.TransactionXid{}, token :: binary) :: no_return())
  @callback(rollback_transaction(conn_id :: Thrift.i64(), start_new_transaction :: boolean(), flags :: %{non_neg_integer => boolean()}, token :: binary) :: no_return())
  @callback(execute_update(conn_id :: Thrift.i64(), sqls :: [String.t()], attrs :: %SnappyData.Thrift.StatementAttrs{}, token :: binary) :: %SnappyData.Thrift.UpdateResult{})
  @callback(execute_prepared_batch(stmt_id :: Thrift.i64(), params_batch :: [%SnappyData.Thrift.Row{}], attrs :: %SnappyData.Thrift.StatementAttrs{}, token :: binary) :: %SnappyData.Thrift.UpdateResult{})
  @callback(get_blob_chunk(conn_id :: Thrift.i64(), lob_id :: Thrift.i64(), offset :: Thrift.i64(), size :: Thrift.i32(), free_lob_at_end :: boolean(), token :: binary) :: %SnappyData.Thrift.BlobChunk{})
  @callback(commit_transaction(conn_id :: Thrift.i64(), start_new_transaction :: boolean(), flags :: %{non_neg_integer => boolean()}, token :: binary) :: no_return())
  @callback(fetch_active_statements(conn_id :: Thrift.i64(), token :: binary) :: %{Thrift.i64() => String.t()})
  @callback(bulk_close(entities :: [%SnappyData.Thrift.EntityId{}]) :: no_return())
  @callback(get_schema_meta_data(schema_call :: non_neg_integer, metadata_args :: %SnappyData.Thrift.ServiceMetaDataArgs{}) :: %SnappyData.Thrift.RowSet{})
  @callback(get_transaction_attributes(conn_id :: Thrift.i64(), token :: binary) :: %{non_neg_integer => boolean()})
  @callback(execute(conn_id :: Thrift.i64(), sql :: String.t(), output_params :: %{Thrift.i32() => %SnappyData.Thrift.OutputParameter{}}, attrs :: %SnappyData.Thrift.StatementAttrs{}, token :: binary) :: %SnappyData.Thrift.StatementResult{})
  @callback(cancel_current_statement(conn_id :: Thrift.i64(), token :: binary) :: no_return())
  @callback(execute_query(conn_id :: Thrift.i64(), sql :: String.t(), attrs :: %SnappyData.Thrift.StatementAttrs{}, token :: binary) :: %SnappyData.Thrift.RowSet{})
  @callback(forget_xa_transaction(conn_id :: Thrift.i64(), xid :: %SnappyData.Thrift.TransactionXid{}, token :: binary) :: no_return())
  @callback(set_transaction_attributes(conn_id :: Thrift.i64(), flags :: %{non_neg_integer => boolean()}, token :: binary) :: no_return())
  @callback(get_preferred_server(server_types :: %MapSet{}, server_groups :: %MapSet{}, failed_servers :: %MapSet{}) :: %SnappyData.Thrift.HostAddress{})
  @callback(close_result_set(cursor_id :: Thrift.i64(), token :: binary) :: no_return())
  @callback(execute_prepared_query(stmt_id :: Thrift.i64(), params :: %SnappyData.Thrift.Row{}, attrs :: %SnappyData.Thrift.StatementAttrs{}, token :: binary) :: %SnappyData.Thrift.RowSet{})
  @callback(free_lob(conn_id :: Thrift.i64(), lob_id :: Thrift.i64(), token :: binary) :: no_return())
  @callback(open_connection(arguments :: %SnappyData.Thrift.OpenConnectionArgs{}) :: %SnappyData.Thrift.ConnectionProperties{})
  @callback(close_statement(stmt_id :: Thrift.i64(), token :: binary) :: no_return())
  @callback(close_connection(conn_id :: Thrift.i64(), close_socket :: boolean(), token :: binary) :: no_return())
  @callback(start_xa_transaction(conn_id :: Thrift.i64(), xid :: %SnappyData.Thrift.TransactionXid{}, timeout_in_seconds :: Thrift.i32(), flags :: Thrift.i32(), token :: binary) :: no_return())
  @callback(recover_xa_transaction(conn_id :: Thrift.i64(), flag :: Thrift.i32(), token :: binary) :: [%SnappyData.Thrift.TransactionXid{}])
  @callback(execute_prepared(stmt_id :: Thrift.i64(), params :: %SnappyData.Thrift.Row{}, output_params :: %{Thrift.i32() => %SnappyData.Thrift.OutputParameter{}}, attrs :: %SnappyData.Thrift.StatementAttrs{}, token :: binary) :: %SnappyData.Thrift.StatementResult{})
  @callback(get_ud_ts(metadata_args :: %SnappyData.Thrift.ServiceMetaDataArgs{}, types :: [non_neg_integer]) :: %SnappyData.Thrift.RowSet{})
  @callback(scroll_cursor(cursor_id :: Thrift.i64(), offset :: Thrift.i32(), offset_is_absolute :: boolean(), fetch_reverse :: boolean(), fetch_size :: Thrift.i32(), token :: binary) :: %SnappyData.Thrift.RowSet{})
  @callback(execute_prepared_update(stmt_id :: Thrift.i64(), params :: %SnappyData.Thrift.Row{}, attrs :: %SnappyData.Thrift.StatementAttrs{}, token :: binary) :: %SnappyData.Thrift.UpdateResult{})
  @callback(get_index_info(metadata_args :: %SnappyData.Thrift.ServiceMetaDataArgs{}, unique :: boolean(), approximate :: boolean()) :: %SnappyData.Thrift.RowSet{})
  @callback(send_blob_chunk(chunk :: %SnappyData.Thrift.BlobChunk{}, conn_id :: Thrift.i64(), token :: binary) :: Thrift.i64())
  @callback(send_clob_chunk(chunk :: %SnappyData.Thrift.ClobChunk{}, conn_id :: Thrift.i64(), token :: binary) :: Thrift.i64())
  @callback(execute_cursor_update(cursor_id :: Thrift.i64(), operations :: [non_neg_integer], changed_rows :: [%SnappyData.Thrift.Row{}], changed_columns_list :: [[Thrift.i32()]], changed_row_indexes :: [Thrift.i32()], token :: binary) :: no_return())
  @callback(get_next_result_set(cursor_id :: Thrift.i64(), other_result_set_behaviour :: Thrift.i8(), token :: binary) :: %SnappyData.Thrift.RowSet{})
  @callback(end_xa_transaction(conn_id :: Thrift.i64(), xid :: %SnappyData.Thrift.TransactionXid{}, flags :: Thrift.i32(), token :: binary) :: no_return())
  @callback(prepare_xa_transaction(conn_id :: Thrift.i64(), xid :: %SnappyData.Thrift.TransactionXid{}, token :: binary) :: Thrift.i32())
  @callback(get_all_servers_with_preferred_server(server_types :: %MapSet{}, server_groups :: %MapSet{}, failed_servers :: %MapSet{}) :: [%SnappyData.Thrift.HostAddress{}])
end