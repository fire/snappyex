defmodule(Thrift.Generated.SnappyDataService.Handler) do
  @callback(prepare_xa_transaction(conn_id :: Thrift.i64(), xid :: %Thrift.Generated.TransactionXid{}, token :: binary) :: Thrift.i32())
  @callback(get_service_meta_data(conn_id :: Thrift.i64(), token :: binary) :: %Thrift.Generated.ServiceMetaData{})
  @callback(rollback_xa_transaction(conn_id :: Thrift.i64(), xid :: %Thrift.Generated.TransactionXid{}, token :: binary) :: no_return())
  @callback(get_clob_chunk(conn_id :: Thrift.i64(), lob_id :: Thrift.i64(), offset :: Thrift.i64(), size :: Thrift.i32(), free_lob_at_end :: boolean(), token :: binary) :: %Thrift.Generated.ClobChunk{})
  @callback(cancel_statement(stmt_id :: Thrift.i64(), token :: binary) :: no_return())
  @callback(get_ud_ts(metadata_args :: %Thrift.Generated.ServiceMetaDataArgs{}, types :: [non_neg_integer]) :: %Thrift.Generated.RowSet{})
  @callback(execute_update(conn_id :: Thrift.i64(), sqls :: [String.t()], attrs :: %Thrift.Generated.StatementAttrs{}, token :: binary) :: %Thrift.Generated.UpdateResult{})
  @callback(get_next_result_set(cursor_id :: Thrift.i64(), other_result_set_behaviour :: Thrift.i8(), token :: binary) :: %Thrift.Generated.RowSet{})
  @callback(begin_transaction(conn_id :: Thrift.i64(), isolation_level :: Thrift.i8(), flags :: %{non_neg_integer => boolean()}, token :: binary) :: Thrift.i8())
  @callback(get_all_servers_with_preferred_server(server_types :: %MapSet{}, server_groups :: %MapSet{}, failed_servers :: %MapSet{}) :: [%Thrift.Generated.HostAddress{}])
  @callback(prepare_and_execute(conn_id :: Thrift.i64(), sql :: String.t(), params_batch :: [%Thrift.Generated.Row{}], output_params :: %{Thrift.i32() => %Thrift.Generated.OutputParameter{}}, attrs :: %Thrift.Generated.StatementAttrs{}, token :: binary) :: %Thrift.Generated.StatementResult{})
  @callback(commit_xa_transaction(conn_id :: Thrift.i64(), xid :: %Thrift.Generated.TransactionXid{}, one_phase :: boolean(), token :: binary) :: no_return())
  @callback(close_connection(conn_id :: Thrift.i64(), close_socket :: boolean(), token :: binary) :: no_return())
  @callback(send_clob_chunk(chunk :: %Thrift.Generated.ClobChunk{}, conn_id :: Thrift.i64(), token :: binary) :: Thrift.i64())
  @callback(execute_prepared(stmt_id :: Thrift.i64(), params :: %Thrift.Generated.Row{}, output_params :: %{Thrift.i32() => %Thrift.Generated.OutputParameter{}}, attrs :: %Thrift.Generated.StatementAttrs{}, token :: binary) :: %Thrift.Generated.StatementResult{})
  @callback(send_blob_chunk(chunk :: %Thrift.Generated.BlobChunk{}, conn_id :: Thrift.i64(), token :: binary) :: Thrift.i64())
  @callback(open_connection(arguments :: %Thrift.Generated.OpenConnectionArgs{}) :: %Thrift.Generated.ConnectionProperties{})
  @callback(close_statement(stmt_id :: Thrift.i64(), token :: binary) :: no_return())
  @callback(fetch_active_statements(conn_id :: Thrift.i64(), token :: binary) :: %{Thrift.i64() => String.t()})
  @callback(execute_query(conn_id :: Thrift.i64(), sql :: String.t(), attrs :: %Thrift.Generated.StatementAttrs{}, token :: binary) :: %Thrift.Generated.RowSet{})
  @callback(commit_transaction(conn_id :: Thrift.i64(), start_new_transaction :: boolean(), flags :: %{non_neg_integer => boolean()}, token :: binary) :: no_return())
  @callback(set_transaction_attributes(conn_id :: Thrift.i64(), flags :: %{non_neg_integer => boolean()}, token :: binary) :: no_return())
  @callback(start_xa_transaction(conn_id :: Thrift.i64(), xid :: %Thrift.Generated.TransactionXid{}, timeout_in_seconds :: Thrift.i32(), flags :: Thrift.i32(), token :: binary) :: no_return())
  @callback(end_xa_transaction(conn_id :: Thrift.i64(), xid :: %Thrift.Generated.TransactionXid{}, flags :: Thrift.i32(), token :: binary) :: no_return())
  @callback(free_lob(conn_id :: Thrift.i64(), lob_id :: Thrift.i64(), token :: binary) :: no_return())
  @callback(forget_xa_transaction(conn_id :: Thrift.i64(), xid :: %Thrift.Generated.TransactionXid{}, token :: binary) :: no_return())
  @callback(cancel_current_statement(conn_id :: Thrift.i64(), token :: binary) :: no_return())
  @callback(recover_xa_transaction(conn_id :: Thrift.i64(), flag :: Thrift.i32(), token :: binary) :: [%Thrift.Generated.TransactionXid{}])
  @callback(get_preferred_server(server_types :: %MapSet{}, server_groups :: %MapSet{}, failed_servers :: %MapSet{}) :: %Thrift.Generated.HostAddress{})
  @callback(get_blob_chunk(conn_id :: Thrift.i64(), lob_id :: Thrift.i64(), offset :: Thrift.i64(), size :: Thrift.i32(), free_lob_at_end :: boolean(), token :: binary) :: %Thrift.Generated.BlobChunk{})
  @callback(fetch_active_connections(conn_id :: Thrift.i64(), token :: binary) :: [%Thrift.Generated.ConnectionProperties{}])
  @callback(execute_prepared_update(stmt_id :: Thrift.i64(), params :: %Thrift.Generated.Row{}, attrs :: %Thrift.Generated.StatementAttrs{}, token :: binary) :: %Thrift.Generated.UpdateResult{})
  @callback(execute(conn_id :: Thrift.i64(), sql :: String.t(), output_params :: %{Thrift.i32() => %Thrift.Generated.OutputParameter{}}, attrs :: %Thrift.Generated.StatementAttrs{}, token :: binary) :: %Thrift.Generated.StatementResult{})
  @callback(get_index_info(metadata_args :: %Thrift.Generated.ServiceMetaDataArgs{}, unique :: boolean(), approximate :: boolean()) :: %Thrift.Generated.RowSet{})
  @callback(scroll_cursor(cursor_id :: Thrift.i64(), offset :: Thrift.i32(), offset_is_absolute :: boolean(), fetch_reverse :: boolean(), fetch_size :: Thrift.i32(), token :: binary) :: %Thrift.Generated.RowSet{})
  @callback(get_transaction_attributes(conn_id :: Thrift.i64(), token :: binary) :: %{non_neg_integer => boolean()})
  @callback(execute_prepared_batch(stmt_id :: Thrift.i64(), params_batch :: [%Thrift.Generated.Row{}], attrs :: %Thrift.Generated.StatementAttrs{}, token :: binary) :: %Thrift.Generated.UpdateResult{})
  @callback(bulk_close(entities :: [%Thrift.Generated.EntityId{}]) :: no_return())
  @callback(rollback_transaction(conn_id :: Thrift.i64(), start_new_transaction :: boolean(), flags :: %{non_neg_integer => boolean()}, token :: binary) :: no_return())
  @callback(execute_prepared_query(stmt_id :: Thrift.i64(), params :: %Thrift.Generated.Row{}, attrs :: %Thrift.Generated.StatementAttrs{}, token :: binary) :: %Thrift.Generated.RowSet{})
  @callback(prepare_statement(conn_id :: Thrift.i64(), sql :: String.t(), output_params :: %{Thrift.i32() => %Thrift.Generated.OutputParameter{}}, attrs :: %Thrift.Generated.StatementAttrs{}, token :: binary) :: %Thrift.Generated.PrepareResult{})
  @callback(close_result_set(cursor_id :: Thrift.i64(), token :: binary) :: no_return())
  @callback(execute_cursor_update(cursor_id :: Thrift.i64(), operations :: [non_neg_integer], changed_rows :: [%Thrift.Generated.Row{}], changed_columns_list :: [[Thrift.i32()]], changed_row_indexes :: [Thrift.i32()], token :: binary) :: no_return())
  @callback(get_best_row_identifier(metadata_args :: %Thrift.Generated.ServiceMetaDataArgs{}, scope :: Thrift.i32(), nullable :: boolean()) :: %Thrift.Generated.RowSet{})
  @callback(get_schema_meta_data(schema_call :: non_neg_integer, metadata_args :: %Thrift.Generated.ServiceMetaDataArgs{}) :: %Thrift.Generated.RowSet{})
end