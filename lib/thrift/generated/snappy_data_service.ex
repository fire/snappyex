defmodule(Thrift.Generated.SnappyDataService) do
  defmodule(GetPreferredServerArgs) do
    _ = "Auto-generated Thrift struct Elixir.GetPreferredServerArgs"
    _ = "1: set<snappydata.ServerType> server_types"
    _ = "2: set<string> server_groups"
    _ = "3: set<snappydata.HostAddress> failed_servers"
    defstruct(server_types: nil, server_groups: nil, failed_servers: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %GetPreferredServerArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %GetPreferredServerArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<14, 1::16-signed, 8, remaining::32-signed, rest::binary>>, struct)) do
        deserialize__server_types(rest, [[], remaining, struct])
      end
      defp(deserialize(<<14, 2::16-signed, 11, remaining::32-signed, rest::binary>>, struct)) do
        deserialize__server_groups(rest, [[], remaining, struct])
      end
      defp(deserialize(<<14, 3::16-signed, 12, remaining::32-signed, rest::binary>>, struct)) do
        deserialize__failed_servers(rest, [[], remaining, struct])
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      defp(deserialize__failed_servers(<<rest::binary>>, [list, 0, struct])) do
        deserialize(rest, %{struct | failed_servers: MapSet.new(list)})
      end
      defp(deserialize__failed_servers(<<rest::binary>>, [list, remaining | stack])) do
        case(Elixir.Thrift.Generated.HostAddress.BinaryProtocol.deserialize(rest)) do
          {element, rest} ->
            deserialize__failed_servers(rest, [[element | list], remaining - 1 | stack])
          :error ->
            :error
        end
      end
      defp(deserialize__failed_servers(_, _)) do
        :error
      end
      defp(deserialize__server_groups(<<rest::binary>>, [list, 0, struct])) do
        deserialize(rest, %{struct | server_groups: MapSet.new(list)})
      end
      defp(deserialize__server_groups(<<string_size::32-signed, element::binary-size(string_size), rest::binary>>, [list, remaining | stack])) do
        deserialize__server_groups(rest, [[element | list], remaining - 1 | stack])
      end
      defp(deserialize__server_groups(_, _)) do
        :error
      end
      defp(deserialize__server_types(<<rest::binary>>, [list, 0, struct])) do
        deserialize(rest, %{struct | server_types: MapSet.new(list)})
      end
      defp(deserialize__server_types(<<element::32-signed, rest::binary>>, [list, remaining | stack])) do
        deserialize__server_types(rest, [[element | list], remaining - 1 | stack])
      end
      defp(deserialize__server_types(_, _)) do
        :error
      end
      def(serialize(%GetPreferredServerArgs{server_types: server_types, server_groups: server_groups, failed_servers: failed_servers})) do
        [case(server_types) do
          nil ->
            <<>>
          _ ->
            [<<14, 1::16-signed, 8, Enum.count(server_types)::32-signed>> | for(e <- server_types) do
              <<e::32-signed>>
            end]
        end, case(server_groups) do
          nil ->
            <<>>
          _ ->
            [<<14, 2::16-signed, 11, Enum.count(server_groups)::32-signed>> | for(e <- server_groups) do
              [<<byte_size(e)::32-signed>> | e]
            end]
        end, case(failed_servers) do
          nil ->
            <<>>
          _ ->
            [<<14, 3::16-signed, 12, Enum.count(failed_servers)::32-signed>> | for(e <- failed_servers) do
              Thrift.Generated.HostAddress.serialize(e)
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
  defmodule(CancelStatementArgs) do
    _ = "Auto-generated Thrift struct Elixir.CancelStatementArgs"
    _ = "1: i64 stmt_id"
    _ = "2: binary token"
    defstruct(stmt_id: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %CancelStatementArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %CancelStatementArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | stmt_id: value})
      end
      defp(deserialize(<<11, 2::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%CancelStatementArgs{stmt_id: stmt_id, token: token})) do
        [case(stmt_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, stmt_id::64-signed>>
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 2::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(GetClobChunkArgs) do
    _ = "Auto-generated Thrift struct Elixir.GetClobChunkArgs"
    _ = "1: i64 conn_id"
    _ = "2: i64 lob_id"
    _ = "3: i64 offset"
    _ = "4: i32 size"
    _ = "5: bool free_lob_at_end"
    _ = "6: binary token"
    defstruct(conn_id: nil, lob_id: nil, offset: nil, size: nil, free_lob_at_end: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %GetClobChunkArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %GetClobChunkArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | conn_id: value})
      end
      defp(deserialize(<<10, 2::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | lob_id: value})
      end
      defp(deserialize(<<10, 3::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | offset: value})
      end
      defp(deserialize(<<8, 4::16-signed, value::32-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | size: value})
      end
      defp(deserialize(<<2, 5::16-signed, 1, rest::binary>>, acc)) do
        deserialize(rest, %{acc | free_lob_at_end: true})
      end
      defp(deserialize(<<2, 5::16-signed, 0, rest::binary>>, acc)) do
        deserialize(rest, %{acc | free_lob_at_end: false})
      end
      defp(deserialize(<<11, 6::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%GetClobChunkArgs{conn_id: conn_id, lob_id: lob_id, offset: offset, size: size, free_lob_at_end: free_lob_at_end, token: token})) do
        [case(conn_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, conn_id::64-signed>>
        end, case(lob_id) do
          nil ->
            <<>>
          _ ->
            <<10, 2::16-signed, lob_id::64-signed>>
        end, case(offset) do
          nil ->
            <<>>
          _ ->
            <<10, 3::16-signed, offset::64-signed>>
        end, case(size) do
          nil ->
            <<>>
          _ ->
            <<8, 4::16-signed, size::32-signed>>
        end, case(free_lob_at_end) do
          nil ->
            <<>>
          false ->
            <<2, 5::16-signed, 0>>
          true ->
            <<2, 5::16-signed, 1>>
          _ ->
            raise(Thrift.InvalidValueError, "Optional boolean field :free_lob_at_end on GetClobChunkArgs must be true, false, or nil")
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 6::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(RecoverXATransactionArgs) do
    _ = "Auto-generated Thrift struct Elixir.RecoverXATransactionArgs"
    _ = "1: i64 conn_id"
    _ = "2: i32 flag"
    _ = "3: binary token"
    defstruct(conn_id: nil, flag: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %RecoverXATransactionArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %RecoverXATransactionArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | conn_id: value})
      end
      defp(deserialize(<<8, 2::16-signed, value::32-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | flag: value})
      end
      defp(deserialize(<<11, 3::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%RecoverXATransactionArgs{conn_id: conn_id, flag: flag, token: token})) do
        [case(conn_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, conn_id::64-signed>>
        end, case(flag) do
          nil ->
            <<>>
          _ ->
            <<8, 2::16-signed, flag::32-signed>>
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 3::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(BeginTransactionArgs) do
    _ = "Auto-generated Thrift struct Elixir.BeginTransactionArgs"
    _ = "1: i64 conn_id"
    _ = "2: i8 isolation_level"
    _ = "3: map<snappydata.TransactionAttribute,bool> flags"
    _ = "4: binary token"
    defstruct(conn_id: nil, isolation_level: nil, flags: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %BeginTransactionArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %BeginTransactionArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | conn_id: value})
      end
      defp(deserialize(<<3, 2::16-signed, value::8-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | isolation_level: value})
      end
      defp(deserialize(<<13, 3::16-signed, 8, 2, map_size::32-signed, rest::binary>>, struct)) do
        deserialize__flags__key(rest, [%{}, map_size, struct])
      end
      defp(deserialize(<<11, 4::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      defp(deserialize__flags__key(<<rest::binary>>, [map, 0, struct])) do
        deserialize(rest, %{struct | flags: map})
      end
      defp(deserialize__flags__key(<<key::32-signed, rest::binary>>, stack)) do
        deserialize__flags__value(rest, key, stack)
      end
      defp(deserialize__flags__key(_, _)) do
        :error
      end
      defp(deserialize__flags__value(<<0, rest::binary>>, key, [map, remaining | stack])) do
        deserialize__flags__key(rest, [Map.put(map, key, false), remaining - 1 | stack])
      end
      defp(deserialize__flags__value(<<1, rest::binary>>, key, [map, remaining | stack])) do
        deserialize__flags__key(rest, [Map.put(map, key, true), remaining - 1 | stack])
      end
      defp(deserialize__flags__value(_, _, _)) do
        :error
      end
      def(serialize(%BeginTransactionArgs{conn_id: conn_id, isolation_level: isolation_level, flags: flags, token: token})) do
        [case(conn_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, conn_id::64-signed>>
        end, case(isolation_level) do
          nil ->
            <<>>
          _ ->
            <<3, 2::16-signed, isolation_level::8-signed>>
        end, case(flags) do
          nil ->
            <<>>
          _ ->
            [<<13, 3::16-signed, 8, 2, Enum.count(flags)::32-signed>> | for({k, v} <- flags) do
              [<<k::32-signed>> | case(v) do
                nil ->
                  <<0>>
                false ->
                  <<0>>
                _ ->
                  <<1>>
              end]
            end]
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 4::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(RollbackTransactionArgs) do
    _ = "Auto-generated Thrift struct Elixir.RollbackTransactionArgs"
    _ = "1: i64 conn_id"
    _ = "2: bool start_new_transaction"
    _ = "3: map<snappydata.TransactionAttribute,bool> flags"
    _ = "4: binary token"
    defstruct(conn_id: nil, start_new_transaction: nil, flags: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %RollbackTransactionArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %RollbackTransactionArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | conn_id: value})
      end
      defp(deserialize(<<2, 2::16-signed, 1, rest::binary>>, acc)) do
        deserialize(rest, %{acc | start_new_transaction: true})
      end
      defp(deserialize(<<2, 2::16-signed, 0, rest::binary>>, acc)) do
        deserialize(rest, %{acc | start_new_transaction: false})
      end
      defp(deserialize(<<13, 3::16-signed, 8, 2, map_size::32-signed, rest::binary>>, struct)) do
        deserialize__flags__key(rest, [%{}, map_size, struct])
      end
      defp(deserialize(<<11, 4::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      defp(deserialize__flags__key(<<rest::binary>>, [map, 0, struct])) do
        deserialize(rest, %{struct | flags: map})
      end
      defp(deserialize__flags__key(<<key::32-signed, rest::binary>>, stack)) do
        deserialize__flags__value(rest, key, stack)
      end
      defp(deserialize__flags__key(_, _)) do
        :error
      end
      defp(deserialize__flags__value(<<0, rest::binary>>, key, [map, remaining | stack])) do
        deserialize__flags__key(rest, [Map.put(map, key, false), remaining - 1 | stack])
      end
      defp(deserialize__flags__value(<<1, rest::binary>>, key, [map, remaining | stack])) do
        deserialize__flags__key(rest, [Map.put(map, key, true), remaining - 1 | stack])
      end
      defp(deserialize__flags__value(_, _, _)) do
        :error
      end
      def(serialize(%RollbackTransactionArgs{conn_id: conn_id, start_new_transaction: start_new_transaction, flags: flags, token: token})) do
        [case(conn_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, conn_id::64-signed>>
        end, case(start_new_transaction) do
          nil ->
            <<>>
          false ->
            <<2, 2::16-signed, 0>>
          true ->
            <<2, 2::16-signed, 1>>
          _ ->
            raise(Thrift.InvalidValueError, "Optional boolean field :start_new_transaction on RollbackTransactionArgs must be true, false, or nil")
        end, case(flags) do
          nil ->
            <<>>
          _ ->
            [<<13, 3::16-signed, 8, 2, Enum.count(flags)::32-signed>> | for({k, v} <- flags) do
              [<<k::32-signed>> | case(v) do
                nil ->
                  <<0>>
                false ->
                  <<0>>
                _ ->
                  <<1>>
              end]
            end]
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 4::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(ExecutePreparedUpdateArgs) do
    _ = "Auto-generated Thrift struct Elixir.ExecutePreparedUpdateArgs"
    _ = "1: i64 stmt_id"
    _ = "2: snappydata.Row params"
    _ = "3: snappydata.StatementAttrs attrs"
    _ = "4: binary token"
    defstruct(stmt_id: nil, params: nil, attrs: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %ExecutePreparedUpdateArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %ExecutePreparedUpdateArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | stmt_id: value})
      end
      defp(deserialize(<<12, 2::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.Row.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | params: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<12, 3::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.StatementAttrs.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | attrs: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<11, 4::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%ExecutePreparedUpdateArgs{stmt_id: stmt_id, params: params, attrs: attrs, token: token})) do
        [case(stmt_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, stmt_id::64-signed>>
        end, case(params) do
          nil ->
            <<>>
          _ ->
            [<<12, 2::16-signed>> | Thrift.Generated.Row.serialize(params)]
        end, case(attrs) do
          nil ->
            <<>>
          _ ->
            [<<12, 3::16-signed>> | Thrift.Generated.StatementAttrs.serialize(attrs)]
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 4::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(FetchActiveStatementsArgs) do
    _ = "Auto-generated Thrift struct Elixir.FetchActiveStatementsArgs"
    _ = "1: i64 conn_id"
    _ = "2: binary token"
    defstruct(conn_id: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %FetchActiveStatementsArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %FetchActiveStatementsArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | conn_id: value})
      end
      defp(deserialize(<<11, 2::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%FetchActiveStatementsArgs{conn_id: conn_id, token: token})) do
        [case(conn_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, conn_id::64-signed>>
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 2::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(OpenConnectionArgs) do
    _ = "Auto-generated Thrift struct Elixir.OpenConnectionArgs"
    _ = "1: snappydata.OpenConnectionArgs arguments"
    defstruct(arguments: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %OpenConnectionArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %OpenConnectionArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.OpenConnectionArgs.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | arguments: value})
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
      def(serialize(%OpenConnectionArgs{arguments: arguments})) do
        [case(arguments) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.OpenConnectionArgs.serialize(arguments)]
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
  defmodule(GetBlobChunkArgs) do
    _ = "Auto-generated Thrift struct Elixir.GetBlobChunkArgs"
    _ = "1: i64 conn_id"
    _ = "2: i64 lob_id"
    _ = "3: i64 offset"
    _ = "4: i32 size"
    _ = "5: bool free_lob_at_end"
    _ = "6: binary token"
    defstruct(conn_id: nil, lob_id: nil, offset: nil, size: nil, free_lob_at_end: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %GetBlobChunkArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %GetBlobChunkArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | conn_id: value})
      end
      defp(deserialize(<<10, 2::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | lob_id: value})
      end
      defp(deserialize(<<10, 3::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | offset: value})
      end
      defp(deserialize(<<8, 4::16-signed, value::32-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | size: value})
      end
      defp(deserialize(<<2, 5::16-signed, 1, rest::binary>>, acc)) do
        deserialize(rest, %{acc | free_lob_at_end: true})
      end
      defp(deserialize(<<2, 5::16-signed, 0, rest::binary>>, acc)) do
        deserialize(rest, %{acc | free_lob_at_end: false})
      end
      defp(deserialize(<<11, 6::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%GetBlobChunkArgs{conn_id: conn_id, lob_id: lob_id, offset: offset, size: size, free_lob_at_end: free_lob_at_end, token: token})) do
        [case(conn_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, conn_id::64-signed>>
        end, case(lob_id) do
          nil ->
            <<>>
          _ ->
            <<10, 2::16-signed, lob_id::64-signed>>
        end, case(offset) do
          nil ->
            <<>>
          _ ->
            <<10, 3::16-signed, offset::64-signed>>
        end, case(size) do
          nil ->
            <<>>
          _ ->
            <<8, 4::16-signed, size::32-signed>>
        end, case(free_lob_at_end) do
          nil ->
            <<>>
          false ->
            <<2, 5::16-signed, 0>>
          true ->
            <<2, 5::16-signed, 1>>
          _ ->
            raise(Thrift.InvalidValueError, "Optional boolean field :free_lob_at_end on GetBlobChunkArgs must be true, false, or nil")
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 6::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(StartXATransactionArgs) do
    _ = "Auto-generated Thrift struct Elixir.StartXATransactionArgs"
    _ = "1: i64 conn_id"
    _ = "2: snappydata.TransactionXid xid"
    _ = "3: i32 timeout_in_seconds"
    _ = "4: i32 flags"
    _ = "5: binary token"
    defstruct(conn_id: nil, xid: nil, timeout_in_seconds: nil, flags: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %StartXATransactionArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %StartXATransactionArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | conn_id: value})
      end
      defp(deserialize(<<12, 2::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.TransactionXid.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | xid: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<8, 3::16-signed, value::32-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | timeout_in_seconds: value})
      end
      defp(deserialize(<<8, 4::16-signed, value::32-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | flags: value})
      end
      defp(deserialize(<<11, 5::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%StartXATransactionArgs{conn_id: conn_id, xid: xid, timeout_in_seconds: timeout_in_seconds, flags: flags, token: token})) do
        [case(conn_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, conn_id::64-signed>>
        end, case(xid) do
          nil ->
            <<>>
          _ ->
            [<<12, 2::16-signed>> | Thrift.Generated.TransactionXid.serialize(xid)]
        end, case(timeout_in_seconds) do
          nil ->
            <<>>
          _ ->
            <<8, 3::16-signed, timeout_in_seconds::32-signed>>
        end, case(flags) do
          nil ->
            <<>>
          _ ->
            <<8, 4::16-signed, flags::32-signed>>
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 5::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(GetUDTsArgs) do
    _ = "Auto-generated Thrift struct Elixir.GetUDTsArgs"
    _ = "1: snappydata.ServiceMetaDataArgs metadata_args"
    _ = "2: list<snappydata.SnappyType> types"
    defstruct(metadata_args: nil, types: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %GetUDTsArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %GetUDTsArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.ServiceMetaDataArgs.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | metadata_args: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<15, 2::16-signed, 8, remaining::32-signed, rest::binary>>, struct)) do
        deserialize__types(rest, [[], remaining, struct])
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      defp(deserialize__types(<<rest::binary>>, [list, 0, struct])) do
        deserialize(rest, %{struct | types: Enum.reverse(list)})
      end
      defp(deserialize__types(<<element::32-signed, rest::binary>>, [list, remaining | stack])) do
        deserialize__types(rest, [[element | list], remaining - 1 | stack])
      end
      defp(deserialize__types(_, _)) do
        :error
      end
      def(serialize(%GetUDTsArgs{metadata_args: metadata_args, types: types})) do
        [case(metadata_args) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.ServiceMetaDataArgs.serialize(metadata_args)]
        end, case(types) do
          nil ->
            <<>>
          _ ->
            [<<15, 2::16-signed, 8, length(types)::32-signed>> | for(e <- types) do
              <<e::32-signed>>
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
  defmodule(GetServiceMetaDataArgs) do
    _ = "Auto-generated Thrift struct Elixir.GetServiceMetaDataArgs"
    _ = "1: i64 conn_id"
    _ = "2: binary token"
    defstruct(conn_id: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %GetServiceMetaDataArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %GetServiceMetaDataArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | conn_id: value})
      end
      defp(deserialize(<<11, 2::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%GetServiceMetaDataArgs{conn_id: conn_id, token: token})) do
        [case(conn_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, conn_id::64-signed>>
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 2::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(PrepareXATransactionArgs) do
    _ = "Auto-generated Thrift struct Elixir.PrepareXATransactionArgs"
    _ = "1: i64 conn_id"
    _ = "2: snappydata.TransactionXid xid"
    _ = "3: binary token"
    defstruct(conn_id: nil, xid: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %PrepareXATransactionArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %PrepareXATransactionArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | conn_id: value})
      end
      defp(deserialize(<<12, 2::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.TransactionXid.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | xid: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<11, 3::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%PrepareXATransactionArgs{conn_id: conn_id, xid: xid, token: token})) do
        [case(conn_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, conn_id::64-signed>>
        end, case(xid) do
          nil ->
            <<>>
          _ ->
            [<<12, 2::16-signed>> | Thrift.Generated.TransactionXid.serialize(xid)]
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 3::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(ExecutePreparedQueryArgs) do
    _ = "Auto-generated Thrift struct Elixir.ExecutePreparedQueryArgs"
    _ = "1: i64 stmt_id"
    _ = "2: snappydata.Row params"
    _ = "3: snappydata.StatementAttrs attrs"
    _ = "4: binary token"
    defstruct(stmt_id: nil, params: nil, attrs: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %ExecutePreparedQueryArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %ExecutePreparedQueryArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | stmt_id: value})
      end
      defp(deserialize(<<12, 2::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.Row.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | params: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<12, 3::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.StatementAttrs.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | attrs: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<11, 4::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%ExecutePreparedQueryArgs{stmt_id: stmt_id, params: params, attrs: attrs, token: token})) do
        [case(stmt_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, stmt_id::64-signed>>
        end, case(params) do
          nil ->
            <<>>
          _ ->
            [<<12, 2::16-signed>> | Thrift.Generated.Row.serialize(params)]
        end, case(attrs) do
          nil ->
            <<>>
          _ ->
            [<<12, 3::16-signed>> | Thrift.Generated.StatementAttrs.serialize(attrs)]
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 4::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(GetAllServersWithPreferredServerArgs) do
    _ = "Auto-generated Thrift struct Elixir.GetAllServersWithPreferredServerArgs"
    _ = "1: set<snappydata.ServerType> server_types"
    _ = "2: set<string> server_groups"
    _ = "3: set<snappydata.HostAddress> failed_servers"
    defstruct(server_types: nil, server_groups: nil, failed_servers: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %GetAllServersWithPreferredServerArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %GetAllServersWithPreferredServerArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<14, 1::16-signed, 8, remaining::32-signed, rest::binary>>, struct)) do
        deserialize__server_types(rest, [[], remaining, struct])
      end
      defp(deserialize(<<14, 2::16-signed, 11, remaining::32-signed, rest::binary>>, struct)) do
        deserialize__server_groups(rest, [[], remaining, struct])
      end
      defp(deserialize(<<14, 3::16-signed, 12, remaining::32-signed, rest::binary>>, struct)) do
        deserialize__failed_servers(rest, [[], remaining, struct])
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      defp(deserialize__failed_servers(<<rest::binary>>, [list, 0, struct])) do
        deserialize(rest, %{struct | failed_servers: MapSet.new(list)})
      end
      defp(deserialize__failed_servers(<<rest::binary>>, [list, remaining | stack])) do
        case(Elixir.Thrift.Generated.HostAddress.BinaryProtocol.deserialize(rest)) do
          {element, rest} ->
            deserialize__failed_servers(rest, [[element | list], remaining - 1 | stack])
          :error ->
            :error
        end
      end
      defp(deserialize__failed_servers(_, _)) do
        :error
      end
      defp(deserialize__server_groups(<<rest::binary>>, [list, 0, struct])) do
        deserialize(rest, %{struct | server_groups: MapSet.new(list)})
      end
      defp(deserialize__server_groups(<<string_size::32-signed, element::binary-size(string_size), rest::binary>>, [list, remaining | stack])) do
        deserialize__server_groups(rest, [[element | list], remaining - 1 | stack])
      end
      defp(deserialize__server_groups(_, _)) do
        :error
      end
      defp(deserialize__server_types(<<rest::binary>>, [list, 0, struct])) do
        deserialize(rest, %{struct | server_types: MapSet.new(list)})
      end
      defp(deserialize__server_types(<<element::32-signed, rest::binary>>, [list, remaining | stack])) do
        deserialize__server_types(rest, [[element | list], remaining - 1 | stack])
      end
      defp(deserialize__server_types(_, _)) do
        :error
      end
      def(serialize(%GetAllServersWithPreferredServerArgs{server_types: server_types, server_groups: server_groups, failed_servers: failed_servers})) do
        [case(server_types) do
          nil ->
            <<>>
          _ ->
            [<<14, 1::16-signed, 8, Enum.count(server_types)::32-signed>> | for(e <- server_types) do
              <<e::32-signed>>
            end]
        end, case(server_groups) do
          nil ->
            <<>>
          _ ->
            [<<14, 2::16-signed, 11, Enum.count(server_groups)::32-signed>> | for(e <- server_groups) do
              [<<byte_size(e)::32-signed>> | e]
            end]
        end, case(failed_servers) do
          nil ->
            <<>>
          _ ->
            [<<14, 3::16-signed, 12, Enum.count(failed_servers)::32-signed>> | for(e <- failed_servers) do
              Thrift.Generated.HostAddress.serialize(e)
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
  defmodule(SendBlobChunkArgs) do
    _ = "Auto-generated Thrift struct Elixir.SendBlobChunkArgs"
    _ = "1: snappydata.BlobChunk chunk"
    _ = "2: i64 conn_id"
    _ = "3: binary token"
    defstruct(chunk: nil, conn_id: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %SendBlobChunkArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %SendBlobChunkArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.BlobChunk.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | chunk: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<10, 2::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | conn_id: value})
      end
      defp(deserialize(<<11, 3::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%SendBlobChunkArgs{chunk: chunk, conn_id: conn_id, token: token})) do
        [case(chunk) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.BlobChunk.serialize(chunk)]
        end, case(conn_id) do
          nil ->
            <<>>
          _ ->
            <<10, 2::16-signed, conn_id::64-signed>>
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 3::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(EndXATransactionArgs) do
    _ = "Auto-generated Thrift struct Elixir.EndXATransactionArgs"
    _ = "1: i64 conn_id"
    _ = "2: snappydata.TransactionXid xid"
    _ = "3: i32 flags"
    _ = "4: binary token"
    defstruct(conn_id: nil, xid: nil, flags: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %EndXATransactionArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %EndXATransactionArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | conn_id: value})
      end
      defp(deserialize(<<12, 2::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.TransactionXid.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | xid: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<8, 3::16-signed, value::32-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | flags: value})
      end
      defp(deserialize(<<11, 4::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%EndXATransactionArgs{conn_id: conn_id, xid: xid, flags: flags, token: token})) do
        [case(conn_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, conn_id::64-signed>>
        end, case(xid) do
          nil ->
            <<>>
          _ ->
            [<<12, 2::16-signed>> | Thrift.Generated.TransactionXid.serialize(xid)]
        end, case(flags) do
          nil ->
            <<>>
          _ ->
            <<8, 3::16-signed, flags::32-signed>>
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 4::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(RollbackXATransactionArgs) do
    _ = "Auto-generated Thrift struct Elixir.RollbackXATransactionArgs"
    _ = "1: i64 conn_id"
    _ = "2: snappydata.TransactionXid xid"
    _ = "3: binary token"
    defstruct(conn_id: nil, xid: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %RollbackXATransactionArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %RollbackXATransactionArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | conn_id: value})
      end
      defp(deserialize(<<12, 2::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.TransactionXid.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | xid: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<11, 3::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%RollbackXATransactionArgs{conn_id: conn_id, xid: xid, token: token})) do
        [case(conn_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, conn_id::64-signed>>
        end, case(xid) do
          nil ->
            <<>>
          _ ->
            [<<12, 2::16-signed>> | Thrift.Generated.TransactionXid.serialize(xid)]
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 3::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(BulkCloseArgs) do
    _ = "Auto-generated Thrift struct Elixir.BulkCloseArgs"
    _ = "1: list<snappydata.EntityId> entities"
    defstruct(entities: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %BulkCloseArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %BulkCloseArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<15, 1::16-signed, 12, remaining::32-signed, rest::binary>>, struct)) do
        deserialize__entities(rest, [[], remaining, struct])
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      defp(deserialize__entities(<<rest::binary>>, [list, 0, struct])) do
        deserialize(rest, %{struct | entities: Enum.reverse(list)})
      end
      defp(deserialize__entities(<<rest::binary>>, [list, remaining | stack])) do
        case(Elixir.Thrift.Generated.EntityId.BinaryProtocol.deserialize(rest)) do
          {element, rest} ->
            deserialize__entities(rest, [[element | list], remaining - 1 | stack])
          :error ->
            :error
        end
      end
      defp(deserialize__entities(_, _)) do
        :error
      end
      def(serialize(%BulkCloseArgs{entities: entities})) do
        [case(entities) do
          nil ->
            <<>>
          _ ->
            [<<15, 1::16-signed, 12, length(entities)::32-signed>> | for(e <- entities) do
              Thrift.Generated.EntityId.serialize(e)
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
  defmodule(PrepareStatementArgs) do
    _ = "Auto-generated Thrift struct Elixir.PrepareStatementArgs"
    _ = "1: i64 conn_id"
    _ = "2: string sql"
    _ = "3: map<i32,snappydata.OutputParameter> output_params"
    _ = "4: snappydata.StatementAttrs attrs"
    _ = "5: binary token"
    defstruct(conn_id: nil, sql: nil, output_params: nil, attrs: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %PrepareStatementArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %PrepareStatementArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | conn_id: value})
      end
      defp(deserialize(<<11, 2::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | sql: value})
      end
      defp(deserialize(<<13, 3::16-signed, 8, 12, map_size::32-signed, rest::binary>>, struct)) do
        deserialize__output_params__key(rest, [%{}, map_size, struct])
      end
      defp(deserialize(<<12, 4::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.StatementAttrs.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | attrs: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<11, 5::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      defp(deserialize__output_params__key(<<rest::binary>>, [map, 0, struct])) do
        deserialize(rest, %{struct | output_params: map})
      end
      defp(deserialize__output_params__key(<<key::32-signed, rest::binary>>, stack)) do
        deserialize__output_params__value(rest, key, stack)
      end
      defp(deserialize__output_params__key(_, _)) do
        :error
      end
      defp(deserialize__output_params__value(<<rest::binary>>, key, [map, remaining | stack])) do
        case(Elixir.Thrift.Generated.OutputParameter.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize__output_params__key(rest, [Map.put(map, key, value), remaining - 1 | stack])
          :error ->
            :error
        end
      end
      defp(deserialize__output_params__value(_, _, _)) do
        :error
      end
      def(serialize(%PrepareStatementArgs{conn_id: conn_id, sql: sql, output_params: output_params, attrs: attrs, token: token})) do
        [case(conn_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, conn_id::64-signed>>
        end, case(sql) do
          nil ->
            <<>>
          _ ->
            [<<11, 2::16-signed, byte_size(sql)::32-signed>> | sql]
        end, case(output_params) do
          nil ->
            <<>>
          _ ->
            [<<13, 3::16-signed, 8, 12, Enum.count(output_params)::32-signed>> | for({k, v} <- output_params) do
              [<<k::32-signed>> | Thrift.Generated.OutputParameter.serialize(v)]
            end]
        end, case(attrs) do
          nil ->
            <<>>
          _ ->
            [<<12, 4::16-signed>> | Thrift.Generated.StatementAttrs.serialize(attrs)]
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 5::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(CommitXATransactionArgs) do
    _ = "Auto-generated Thrift struct Elixir.CommitXATransactionArgs"
    _ = "1: i64 conn_id"
    _ = "2: snappydata.TransactionXid xid"
    _ = "3: bool one_phase"
    _ = "4: binary token"
    defstruct(conn_id: nil, xid: nil, one_phase: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %CommitXATransactionArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %CommitXATransactionArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | conn_id: value})
      end
      defp(deserialize(<<12, 2::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.TransactionXid.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | xid: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<2, 3::16-signed, 1, rest::binary>>, acc)) do
        deserialize(rest, %{acc | one_phase: true})
      end
      defp(deserialize(<<2, 3::16-signed, 0, rest::binary>>, acc)) do
        deserialize(rest, %{acc | one_phase: false})
      end
      defp(deserialize(<<11, 4::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%CommitXATransactionArgs{conn_id: conn_id, xid: xid, one_phase: one_phase, token: token})) do
        [case(conn_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, conn_id::64-signed>>
        end, case(xid) do
          nil ->
            <<>>
          _ ->
            [<<12, 2::16-signed>> | Thrift.Generated.TransactionXid.serialize(xid)]
        end, case(one_phase) do
          nil ->
            <<>>
          false ->
            <<2, 3::16-signed, 0>>
          true ->
            <<2, 3::16-signed, 1>>
          _ ->
            raise(Thrift.InvalidValueError, "Optional boolean field :one_phase on CommitXATransactionArgs must be true, false, or nil")
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 4::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(ExecuteCursorUpdateArgs) do
    _ = "Auto-generated Thrift struct Elixir.ExecuteCursorUpdateArgs"
    _ = "1: i64 cursor_id"
    _ = "2: list<snappydata.CursorUpdateOperation> operations"
    _ = "3: list<snappydata.Row> changed_rows"
    _ = "4: list<list<i32>> changed_columns_list"
    _ = "5: list<i32> changed_row_indexes"
    _ = "6: binary token"
    defstruct(cursor_id: nil, operations: nil, changed_rows: nil, changed_columns_list: nil, changed_row_indexes: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %ExecuteCursorUpdateArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %ExecuteCursorUpdateArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | cursor_id: value})
      end
      defp(deserialize(<<15, 2::16-signed, 8, remaining::32-signed, rest::binary>>, struct)) do
        deserialize__operations(rest, [[], remaining, struct])
      end
      defp(deserialize(<<15, 3::16-signed, 12, remaining::32-signed, rest::binary>>, struct)) do
        deserialize__changed_rows(rest, [[], remaining, struct])
      end
      defp(deserialize(<<15, 4::16-signed, 15, remaining::32-signed, rest::binary>>, struct)) do
        deserialize__changed_columns_list(rest, [[], remaining, struct])
      end
      defp(deserialize(<<15, 5::16-signed, 8, remaining::32-signed, rest::binary>>, struct)) do
        deserialize__changed_row_indexes(rest, [[], remaining, struct])
      end
      defp(deserialize(<<11, 6::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      defp(deserialize__changed_columns_list(<<rest::binary>>, [list, 0, struct])) do
        deserialize(rest, %{struct | changed_columns_list: Enum.reverse(list)})
      end
      defp(deserialize__changed_columns_list(<<8, inner_remaining::32-signed, rest::binary>>, [list, remaining | stack])) do
        deserialize__changed_columns_list__element(rest, [[], inner_remaining, list, remaining | stack])
      end
      defp(deserialize__changed_columns_list(_, _)) do
        :error
      end
      defp(deserialize__changed_columns_list__element(<<rest::binary>>, [inner_list, 0, list, remaining | stack])) do
        deserialize__changed_columns_list(rest, [[Enum.reverse(inner_list) | list], remaining - 1 | stack])
      end
      defp(deserialize__changed_columns_list__element(<<element::32-signed, rest::binary>>, [list, remaining | stack])) do
        deserialize__changed_columns_list__element(rest, [[element | list], remaining - 1 | stack])
      end
      defp(deserialize__changed_columns_list__element(_, _)) do
        :error
      end
      defp(deserialize__changed_row_indexes(<<rest::binary>>, [list, 0, struct])) do
        deserialize(rest, %{struct | changed_row_indexes: Enum.reverse(list)})
      end
      defp(deserialize__changed_row_indexes(<<element::32-signed, rest::binary>>, [list, remaining | stack])) do
        deserialize__changed_row_indexes(rest, [[element | list], remaining - 1 | stack])
      end
      defp(deserialize__changed_row_indexes(_, _)) do
        :error
      end
      defp(deserialize__changed_rows(<<rest::binary>>, [list, 0, struct])) do
        deserialize(rest, %{struct | changed_rows: Enum.reverse(list)})
      end
      defp(deserialize__changed_rows(<<rest::binary>>, [list, remaining | stack])) do
        case(Elixir.Thrift.Generated.Row.BinaryProtocol.deserialize(rest)) do
          {element, rest} ->
            deserialize__changed_rows(rest, [[element | list], remaining - 1 | stack])
          :error ->
            :error
        end
      end
      defp(deserialize__changed_rows(_, _)) do
        :error
      end
      defp(deserialize__operations(<<rest::binary>>, [list, 0, struct])) do
        deserialize(rest, %{struct | operations: Enum.reverse(list)})
      end
      defp(deserialize__operations(<<element::32-signed, rest::binary>>, [list, remaining | stack])) do
        deserialize__operations(rest, [[element | list], remaining - 1 | stack])
      end
      defp(deserialize__operations(_, _)) do
        :error
      end
      def(serialize(%ExecuteCursorUpdateArgs{cursor_id: cursor_id, operations: operations, changed_rows: changed_rows, changed_columns_list: changed_columns_list, changed_row_indexes: changed_row_indexes, token: token})) do
        [case(cursor_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, cursor_id::64-signed>>
        end, case(operations) do
          nil ->
            <<>>
          _ ->
            [<<15, 2::16-signed, 8, length(operations)::32-signed>> | for(e <- operations) do
              <<e::32-signed>>
            end]
        end, case(changed_rows) do
          nil ->
            <<>>
          _ ->
            [<<15, 3::16-signed, 12, length(changed_rows)::32-signed>> | for(e <- changed_rows) do
              Thrift.Generated.Row.serialize(e)
            end]
        end, case(changed_columns_list) do
          nil ->
            <<>>
          _ ->
            [<<15, 4::16-signed, 15, length(changed_columns_list)::32-signed>> | for(e <- changed_columns_list) do
              [<<8, length(e)::32-signed>> | for(e <- e) do
                <<e::32-signed>>
              end]
            end]
        end, case(changed_row_indexes) do
          nil ->
            <<>>
          _ ->
            [<<15, 5::16-signed, 8, length(changed_row_indexes)::32-signed>> | for(e <- changed_row_indexes) do
              <<e::32-signed>>
            end]
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 6::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(SetTransactionAttributesArgs) do
    _ = "Auto-generated Thrift struct Elixir.SetTransactionAttributesArgs"
    _ = "1: i64 conn_id"
    _ = "2: map<snappydata.TransactionAttribute,bool> flags"
    _ = "3: binary token"
    defstruct(conn_id: nil, flags: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %SetTransactionAttributesArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %SetTransactionAttributesArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | conn_id: value})
      end
      defp(deserialize(<<13, 2::16-signed, 8, 2, map_size::32-signed, rest::binary>>, struct)) do
        deserialize__flags__key(rest, [%{}, map_size, struct])
      end
      defp(deserialize(<<11, 3::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      defp(deserialize__flags__key(<<rest::binary>>, [map, 0, struct])) do
        deserialize(rest, %{struct | flags: map})
      end
      defp(deserialize__flags__key(<<key::32-signed, rest::binary>>, stack)) do
        deserialize__flags__value(rest, key, stack)
      end
      defp(deserialize__flags__key(_, _)) do
        :error
      end
      defp(deserialize__flags__value(<<0, rest::binary>>, key, [map, remaining | stack])) do
        deserialize__flags__key(rest, [Map.put(map, key, false), remaining - 1 | stack])
      end
      defp(deserialize__flags__value(<<1, rest::binary>>, key, [map, remaining | stack])) do
        deserialize__flags__key(rest, [Map.put(map, key, true), remaining - 1 | stack])
      end
      defp(deserialize__flags__value(_, _, _)) do
        :error
      end
      def(serialize(%SetTransactionAttributesArgs{conn_id: conn_id, flags: flags, token: token})) do
        [case(conn_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, conn_id::64-signed>>
        end, case(flags) do
          nil ->
            <<>>
          _ ->
            [<<13, 2::16-signed, 8, 2, Enum.count(flags)::32-signed>> | for({k, v} <- flags) do
              [<<k::32-signed>> | case(v) do
                nil ->
                  <<0>>
                false ->
                  <<0>>
                _ ->
                  <<1>>
              end]
            end]
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 3::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(ExecutePreparedBatchArgs) do
    _ = "Auto-generated Thrift struct Elixir.ExecutePreparedBatchArgs"
    _ = "1: i64 stmt_id"
    _ = "2: list<snappydata.Row> params_batch"
    _ = "3: snappydata.StatementAttrs attrs"
    _ = "4: binary token"
    defstruct(stmt_id: nil, params_batch: nil, attrs: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %ExecutePreparedBatchArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %ExecutePreparedBatchArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | stmt_id: value})
      end
      defp(deserialize(<<15, 2::16-signed, 12, remaining::32-signed, rest::binary>>, struct)) do
        deserialize__params_batch(rest, [[], remaining, struct])
      end
      defp(deserialize(<<12, 3::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.StatementAttrs.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | attrs: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<11, 4::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      defp(deserialize__params_batch(<<rest::binary>>, [list, 0, struct])) do
        deserialize(rest, %{struct | params_batch: Enum.reverse(list)})
      end
      defp(deserialize__params_batch(<<rest::binary>>, [list, remaining | stack])) do
        case(Elixir.Thrift.Generated.Row.BinaryProtocol.deserialize(rest)) do
          {element, rest} ->
            deserialize__params_batch(rest, [[element | list], remaining - 1 | stack])
          :error ->
            :error
        end
      end
      defp(deserialize__params_batch(_, _)) do
        :error
      end
      def(serialize(%ExecutePreparedBatchArgs{stmt_id: stmt_id, params_batch: params_batch, attrs: attrs, token: token})) do
        [case(stmt_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, stmt_id::64-signed>>
        end, case(params_batch) do
          nil ->
            <<>>
          _ ->
            [<<15, 2::16-signed, 12, length(params_batch)::32-signed>> | for(e <- params_batch) do
              Thrift.Generated.Row.serialize(e)
            end]
        end, case(attrs) do
          nil ->
            <<>>
          _ ->
            [<<12, 3::16-signed>> | Thrift.Generated.StatementAttrs.serialize(attrs)]
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 4::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(FreeLobArgs) do
    _ = "Auto-generated Thrift struct Elixir.FreeLobArgs"
    _ = "1: i64 conn_id"
    _ = "2: i64 lob_id"
    _ = "3: binary token"
    defstruct(conn_id: nil, lob_id: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %FreeLobArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %FreeLobArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | conn_id: value})
      end
      defp(deserialize(<<10, 2::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | lob_id: value})
      end
      defp(deserialize(<<11, 3::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%FreeLobArgs{conn_id: conn_id, lob_id: lob_id, token: token})) do
        [case(conn_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, conn_id::64-signed>>
        end, case(lob_id) do
          nil ->
            <<>>
          _ ->
            <<10, 2::16-signed, lob_id::64-signed>>
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 3::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(GetNextResultSetArgs) do
    _ = "Auto-generated Thrift struct Elixir.GetNextResultSetArgs"
    _ = "1: i64 cursor_id"
    _ = "2: i8 other_result_set_behaviour"
    _ = "3: binary token"
    defstruct(cursor_id: nil, other_result_set_behaviour: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %GetNextResultSetArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %GetNextResultSetArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | cursor_id: value})
      end
      defp(deserialize(<<3, 2::16-signed, value::8-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | other_result_set_behaviour: value})
      end
      defp(deserialize(<<11, 3::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%GetNextResultSetArgs{cursor_id: cursor_id, other_result_set_behaviour: other_result_set_behaviour, token: token})) do
        [case(cursor_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, cursor_id::64-signed>>
        end, case(other_result_set_behaviour) do
          nil ->
            <<>>
          _ ->
            <<3, 2::16-signed, other_result_set_behaviour::8-signed>>
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 3::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(FetchActiveConnectionsArgs) do
    _ = "Auto-generated Thrift struct Elixir.FetchActiveConnectionsArgs"
    _ = "1: i64 conn_id"
    _ = "2: binary token"
    defstruct(conn_id: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %FetchActiveConnectionsArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %FetchActiveConnectionsArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | conn_id: value})
      end
      defp(deserialize(<<11, 2::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%FetchActiveConnectionsArgs{conn_id: conn_id, token: token})) do
        [case(conn_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, conn_id::64-signed>>
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 2::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(CloseConnectionArgs) do
    _ = "Auto-generated Thrift struct Elixir.CloseConnectionArgs"
    _ = "1: i64 conn_id"
    _ = "2: bool close_socket"
    _ = "3: binary token"
    defstruct(conn_id: nil, close_socket: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %CloseConnectionArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %CloseConnectionArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | conn_id: value})
      end
      defp(deserialize(<<2, 2::16-signed, 1, rest::binary>>, acc)) do
        deserialize(rest, %{acc | close_socket: true})
      end
      defp(deserialize(<<2, 2::16-signed, 0, rest::binary>>, acc)) do
        deserialize(rest, %{acc | close_socket: false})
      end
      defp(deserialize(<<11, 3::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%CloseConnectionArgs{conn_id: conn_id, close_socket: close_socket, token: token})) do
        [case(conn_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, conn_id::64-signed>>
        end, case(close_socket) do
          nil ->
            <<>>
          false ->
            <<2, 2::16-signed, 0>>
          true ->
            <<2, 2::16-signed, 1>>
          _ ->
            raise(Thrift.InvalidValueError, "Optional boolean field :close_socket on CloseConnectionArgs must be true, false, or nil")
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 3::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(ExecuteArgs) do
    _ = "Auto-generated Thrift struct Elixir.ExecuteArgs"
    _ = "1: i64 conn_id"
    _ = "2: string sql"
    _ = "3: map<i32,snappydata.OutputParameter> output_params"
    _ = "4: snappydata.StatementAttrs attrs"
    _ = "5: binary token"
    defstruct(conn_id: nil, sql: nil, output_params: nil, attrs: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %ExecuteArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %ExecuteArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | conn_id: value})
      end
      defp(deserialize(<<11, 2::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | sql: value})
      end
      defp(deserialize(<<13, 3::16-signed, 8, 12, map_size::32-signed, rest::binary>>, struct)) do
        deserialize__output_params__key(rest, [%{}, map_size, struct])
      end
      defp(deserialize(<<12, 4::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.StatementAttrs.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | attrs: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<11, 5::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      defp(deserialize__output_params__key(<<rest::binary>>, [map, 0, struct])) do
        deserialize(rest, %{struct | output_params: map})
      end
      defp(deserialize__output_params__key(<<key::32-signed, rest::binary>>, stack)) do
        deserialize__output_params__value(rest, key, stack)
      end
      defp(deserialize__output_params__key(_, _)) do
        :error
      end
      defp(deserialize__output_params__value(<<rest::binary>>, key, [map, remaining | stack])) do
        case(Elixir.Thrift.Generated.OutputParameter.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize__output_params__key(rest, [Map.put(map, key, value), remaining - 1 | stack])
          :error ->
            :error
        end
      end
      defp(deserialize__output_params__value(_, _, _)) do
        :error
      end
      def(serialize(%ExecuteArgs{conn_id: conn_id, sql: sql, output_params: output_params, attrs: attrs, token: token})) do
        [case(conn_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, conn_id::64-signed>>
        end, case(sql) do
          nil ->
            <<>>
          _ ->
            [<<11, 2::16-signed, byte_size(sql)::32-signed>> | sql]
        end, case(output_params) do
          nil ->
            <<>>
          _ ->
            [<<13, 3::16-signed, 8, 12, Enum.count(output_params)::32-signed>> | for({k, v} <- output_params) do
              [<<k::32-signed>> | Thrift.Generated.OutputParameter.serialize(v)]
            end]
        end, case(attrs) do
          nil ->
            <<>>
          _ ->
            [<<12, 4::16-signed>> | Thrift.Generated.StatementAttrs.serialize(attrs)]
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 5::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(ExecuteQueryArgs) do
    _ = "Auto-generated Thrift struct Elixir.ExecuteQueryArgs"
    _ = "1: i64 conn_id"
    _ = "2: string sql"
    _ = "3: snappydata.StatementAttrs attrs"
    _ = "4: binary token"
    defstruct(conn_id: nil, sql: nil, attrs: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %ExecuteQueryArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %ExecuteQueryArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | conn_id: value})
      end
      defp(deserialize(<<11, 2::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | sql: value})
      end
      defp(deserialize(<<12, 3::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.StatementAttrs.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | attrs: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<11, 4::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%ExecuteQueryArgs{conn_id: conn_id, sql: sql, attrs: attrs, token: token})) do
        [case(conn_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, conn_id::64-signed>>
        end, case(sql) do
          nil ->
            <<>>
          _ ->
            [<<11, 2::16-signed, byte_size(sql)::32-signed>> | sql]
        end, case(attrs) do
          nil ->
            <<>>
          _ ->
            [<<12, 3::16-signed>> | Thrift.Generated.StatementAttrs.serialize(attrs)]
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 4::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(GetTransactionAttributesArgs) do
    _ = "Auto-generated Thrift struct Elixir.GetTransactionAttributesArgs"
    _ = "1: i64 conn_id"
    _ = "2: binary token"
    defstruct(conn_id: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %GetTransactionAttributesArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %GetTransactionAttributesArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | conn_id: value})
      end
      defp(deserialize(<<11, 2::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%GetTransactionAttributesArgs{conn_id: conn_id, token: token})) do
        [case(conn_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, conn_id::64-signed>>
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 2::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(SendClobChunkArgs) do
    _ = "Auto-generated Thrift struct Elixir.SendClobChunkArgs"
    _ = "1: snappydata.ClobChunk chunk"
    _ = "2: i64 conn_id"
    _ = "3: binary token"
    defstruct(chunk: nil, conn_id: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %SendClobChunkArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %SendClobChunkArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.ClobChunk.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | chunk: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<10, 2::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | conn_id: value})
      end
      defp(deserialize(<<11, 3::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%SendClobChunkArgs{chunk: chunk, conn_id: conn_id, token: token})) do
        [case(chunk) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.ClobChunk.serialize(chunk)]
        end, case(conn_id) do
          nil ->
            <<>>
          _ ->
            <<10, 2::16-signed, conn_id::64-signed>>
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 3::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(CloseResultSetArgs) do
    _ = "Auto-generated Thrift struct Elixir.CloseResultSetArgs"
    _ = "1: i64 cursor_id"
    _ = "2: binary token"
    defstruct(cursor_id: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %CloseResultSetArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %CloseResultSetArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | cursor_id: value})
      end
      defp(deserialize(<<11, 2::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%CloseResultSetArgs{cursor_id: cursor_id, token: token})) do
        [case(cursor_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, cursor_id::64-signed>>
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 2::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(ExecutePreparedArgs) do
    _ = "Auto-generated Thrift struct Elixir.ExecutePreparedArgs"
    _ = "1: i64 stmt_id"
    _ = "2: snappydata.Row params"
    _ = "3: map<i32,snappydata.OutputParameter> output_params"
    _ = "4: snappydata.StatementAttrs attrs"
    _ = "5: binary token"
    defstruct(stmt_id: nil, params: nil, output_params: nil, attrs: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %ExecutePreparedArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %ExecutePreparedArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | stmt_id: value})
      end
      defp(deserialize(<<12, 2::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.Row.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | params: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<13, 3::16-signed, 8, 12, map_size::32-signed, rest::binary>>, struct)) do
        deserialize__output_params__key(rest, [%{}, map_size, struct])
      end
      defp(deserialize(<<12, 4::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.StatementAttrs.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | attrs: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<11, 5::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      defp(deserialize__output_params__key(<<rest::binary>>, [map, 0, struct])) do
        deserialize(rest, %{struct | output_params: map})
      end
      defp(deserialize__output_params__key(<<key::32-signed, rest::binary>>, stack)) do
        deserialize__output_params__value(rest, key, stack)
      end
      defp(deserialize__output_params__key(_, _)) do
        :error
      end
      defp(deserialize__output_params__value(<<rest::binary>>, key, [map, remaining | stack])) do
        case(Elixir.Thrift.Generated.OutputParameter.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize__output_params__key(rest, [Map.put(map, key, value), remaining - 1 | stack])
          :error ->
            :error
        end
      end
      defp(deserialize__output_params__value(_, _, _)) do
        :error
      end
      def(serialize(%ExecutePreparedArgs{stmt_id: stmt_id, params: params, output_params: output_params, attrs: attrs, token: token})) do
        [case(stmt_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, stmt_id::64-signed>>
        end, case(params) do
          nil ->
            <<>>
          _ ->
            [<<12, 2::16-signed>> | Thrift.Generated.Row.serialize(params)]
        end, case(output_params) do
          nil ->
            <<>>
          _ ->
            [<<13, 3::16-signed, 8, 12, Enum.count(output_params)::32-signed>> | for({k, v} <- output_params) do
              [<<k::32-signed>> | Thrift.Generated.OutputParameter.serialize(v)]
            end]
        end, case(attrs) do
          nil ->
            <<>>
          _ ->
            [<<12, 4::16-signed>> | Thrift.Generated.StatementAttrs.serialize(attrs)]
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 5::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(CloseStatementArgs) do
    _ = "Auto-generated Thrift struct Elixir.CloseStatementArgs"
    _ = "1: i64 stmt_id"
    _ = "2: binary token"
    defstruct(stmt_id: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %CloseStatementArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %CloseStatementArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | stmt_id: value})
      end
      defp(deserialize(<<11, 2::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%CloseStatementArgs{stmt_id: stmt_id, token: token})) do
        [case(stmt_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, stmt_id::64-signed>>
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 2::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(CommitTransactionArgs) do
    _ = "Auto-generated Thrift struct Elixir.CommitTransactionArgs"
    _ = "1: i64 conn_id"
    _ = "2: bool start_new_transaction"
    _ = "3: map<snappydata.TransactionAttribute,bool> flags"
    _ = "4: binary token"
    defstruct(conn_id: nil, start_new_transaction: nil, flags: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %CommitTransactionArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %CommitTransactionArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | conn_id: value})
      end
      defp(deserialize(<<2, 2::16-signed, 1, rest::binary>>, acc)) do
        deserialize(rest, %{acc | start_new_transaction: true})
      end
      defp(deserialize(<<2, 2::16-signed, 0, rest::binary>>, acc)) do
        deserialize(rest, %{acc | start_new_transaction: false})
      end
      defp(deserialize(<<13, 3::16-signed, 8, 2, map_size::32-signed, rest::binary>>, struct)) do
        deserialize__flags__key(rest, [%{}, map_size, struct])
      end
      defp(deserialize(<<11, 4::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      defp(deserialize__flags__key(<<rest::binary>>, [map, 0, struct])) do
        deserialize(rest, %{struct | flags: map})
      end
      defp(deserialize__flags__key(<<key::32-signed, rest::binary>>, stack)) do
        deserialize__flags__value(rest, key, stack)
      end
      defp(deserialize__flags__key(_, _)) do
        :error
      end
      defp(deserialize__flags__value(<<0, rest::binary>>, key, [map, remaining | stack])) do
        deserialize__flags__key(rest, [Map.put(map, key, false), remaining - 1 | stack])
      end
      defp(deserialize__flags__value(<<1, rest::binary>>, key, [map, remaining | stack])) do
        deserialize__flags__key(rest, [Map.put(map, key, true), remaining - 1 | stack])
      end
      defp(deserialize__flags__value(_, _, _)) do
        :error
      end
      def(serialize(%CommitTransactionArgs{conn_id: conn_id, start_new_transaction: start_new_transaction, flags: flags, token: token})) do
        [case(conn_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, conn_id::64-signed>>
        end, case(start_new_transaction) do
          nil ->
            <<>>
          false ->
            <<2, 2::16-signed, 0>>
          true ->
            <<2, 2::16-signed, 1>>
          _ ->
            raise(Thrift.InvalidValueError, "Optional boolean field :start_new_transaction on CommitTransactionArgs must be true, false, or nil")
        end, case(flags) do
          nil ->
            <<>>
          _ ->
            [<<13, 3::16-signed, 8, 2, Enum.count(flags)::32-signed>> | for({k, v} <- flags) do
              [<<k::32-signed>> | case(v) do
                nil ->
                  <<0>>
                false ->
                  <<0>>
                _ ->
                  <<1>>
              end]
            end]
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 4::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(PrepareAndExecuteArgs) do
    _ = "Auto-generated Thrift struct Elixir.PrepareAndExecuteArgs"
    _ = "1: i64 conn_id"
    _ = "2: string sql"
    _ = "3: list<snappydata.Row> params_batch"
    _ = "4: map<i32,snappydata.OutputParameter> output_params"
    _ = "5: snappydata.StatementAttrs attrs"
    _ = "6: binary token"
    defstruct(conn_id: nil, sql: nil, params_batch: nil, output_params: nil, attrs: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %PrepareAndExecuteArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %PrepareAndExecuteArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | conn_id: value})
      end
      defp(deserialize(<<11, 2::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | sql: value})
      end
      defp(deserialize(<<15, 3::16-signed, 12, remaining::32-signed, rest::binary>>, struct)) do
        deserialize__params_batch(rest, [[], remaining, struct])
      end
      defp(deserialize(<<13, 4::16-signed, 8, 12, map_size::32-signed, rest::binary>>, struct)) do
        deserialize__output_params__key(rest, [%{}, map_size, struct])
      end
      defp(deserialize(<<12, 5::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.StatementAttrs.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | attrs: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<11, 6::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      defp(deserialize__output_params__key(<<rest::binary>>, [map, 0, struct])) do
        deserialize(rest, %{struct | output_params: map})
      end
      defp(deserialize__output_params__key(<<key::32-signed, rest::binary>>, stack)) do
        deserialize__output_params__value(rest, key, stack)
      end
      defp(deserialize__output_params__key(_, _)) do
        :error
      end
      defp(deserialize__output_params__value(<<rest::binary>>, key, [map, remaining | stack])) do
        case(Elixir.Thrift.Generated.OutputParameter.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize__output_params__key(rest, [Map.put(map, key, value), remaining - 1 | stack])
          :error ->
            :error
        end
      end
      defp(deserialize__output_params__value(_, _, _)) do
        :error
      end
      defp(deserialize__params_batch(<<rest::binary>>, [list, 0, struct])) do
        deserialize(rest, %{struct | params_batch: Enum.reverse(list)})
      end
      defp(deserialize__params_batch(<<rest::binary>>, [list, remaining | stack])) do
        case(Elixir.Thrift.Generated.Row.BinaryProtocol.deserialize(rest)) do
          {element, rest} ->
            deserialize__params_batch(rest, [[element | list], remaining - 1 | stack])
          :error ->
            :error
        end
      end
      defp(deserialize__params_batch(_, _)) do
        :error
      end
      def(serialize(%PrepareAndExecuteArgs{conn_id: conn_id, sql: sql, params_batch: params_batch, output_params: output_params, attrs: attrs, token: token})) do
        [case(conn_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, conn_id::64-signed>>
        end, case(sql) do
          nil ->
            <<>>
          _ ->
            [<<11, 2::16-signed, byte_size(sql)::32-signed>> | sql]
        end, case(params_batch) do
          nil ->
            <<>>
          _ ->
            [<<15, 3::16-signed, 12, length(params_batch)::32-signed>> | for(e <- params_batch) do
              Thrift.Generated.Row.serialize(e)
            end]
        end, case(output_params) do
          nil ->
            <<>>
          _ ->
            [<<13, 4::16-signed, 8, 12, Enum.count(output_params)::32-signed>> | for({k, v} <- output_params) do
              [<<k::32-signed>> | Thrift.Generated.OutputParameter.serialize(v)]
            end]
        end, case(attrs) do
          nil ->
            <<>>
          _ ->
            [<<12, 5::16-signed>> | Thrift.Generated.StatementAttrs.serialize(attrs)]
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 6::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(ForgetXATransactionArgs) do
    _ = "Auto-generated Thrift struct Elixir.ForgetXATransactionArgs"
    _ = "1: i64 conn_id"
    _ = "2: snappydata.TransactionXid xid"
    _ = "3: binary token"
    defstruct(conn_id: nil, xid: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %ForgetXATransactionArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %ForgetXATransactionArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | conn_id: value})
      end
      defp(deserialize(<<12, 2::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.TransactionXid.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | xid: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<11, 3::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%ForgetXATransactionArgs{conn_id: conn_id, xid: xid, token: token})) do
        [case(conn_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, conn_id::64-signed>>
        end, case(xid) do
          nil ->
            <<>>
          _ ->
            [<<12, 2::16-signed>> | Thrift.Generated.TransactionXid.serialize(xid)]
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 3::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(GetIndexInfoArgs) do
    _ = "Auto-generated Thrift struct Elixir.GetIndexInfoArgs"
    _ = "1: snappydata.ServiceMetaDataArgs metadata_args"
    _ = "2: bool unique"
    _ = "3: bool approximate"
    defstruct(metadata_args: nil, unique: nil, approximate: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %GetIndexInfoArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %GetIndexInfoArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.ServiceMetaDataArgs.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | metadata_args: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<2, 2::16-signed, 1, rest::binary>>, acc)) do
        deserialize(rest, %{acc | unique: true})
      end
      defp(deserialize(<<2, 2::16-signed, 0, rest::binary>>, acc)) do
        deserialize(rest, %{acc | unique: false})
      end
      defp(deserialize(<<2, 3::16-signed, 1, rest::binary>>, acc)) do
        deserialize(rest, %{acc | approximate: true})
      end
      defp(deserialize(<<2, 3::16-signed, 0, rest::binary>>, acc)) do
        deserialize(rest, %{acc | approximate: false})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%GetIndexInfoArgs{metadata_args: metadata_args, unique: unique, approximate: approximate})) do
        [case(metadata_args) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.ServiceMetaDataArgs.serialize(metadata_args)]
        end, case(unique) do
          nil ->
            <<>>
          false ->
            <<2, 2::16-signed, 0>>
          true ->
            <<2, 2::16-signed, 1>>
          _ ->
            raise(Thrift.InvalidValueError, "Optional boolean field :unique on GetIndexInfoArgs must be true, false, or nil")
        end, case(approximate) do
          nil ->
            <<>>
          false ->
            <<2, 3::16-signed, 0>>
          true ->
            <<2, 3::16-signed, 1>>
          _ ->
            raise(Thrift.InvalidValueError, "Optional boolean field :approximate on GetIndexInfoArgs must be true, false, or nil")
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
  defmodule(ScrollCursorArgs) do
    _ = "Auto-generated Thrift struct Elixir.ScrollCursorArgs"
    _ = "1: i64 cursor_id"
    _ = "2: i32 offset"
    _ = "3: bool offset_is_absolute"
    _ = "4: bool fetch_reverse"
    _ = "5: i32 fetch_size"
    _ = "6: binary token"
    defstruct(cursor_id: nil, offset: nil, offset_is_absolute: nil, fetch_reverse: nil, fetch_size: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %ScrollCursorArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %ScrollCursorArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | cursor_id: value})
      end
      defp(deserialize(<<8, 2::16-signed, value::32-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | offset: value})
      end
      defp(deserialize(<<2, 3::16-signed, 1, rest::binary>>, acc)) do
        deserialize(rest, %{acc | offset_is_absolute: true})
      end
      defp(deserialize(<<2, 3::16-signed, 0, rest::binary>>, acc)) do
        deserialize(rest, %{acc | offset_is_absolute: false})
      end
      defp(deserialize(<<2, 4::16-signed, 1, rest::binary>>, acc)) do
        deserialize(rest, %{acc | fetch_reverse: true})
      end
      defp(deserialize(<<2, 4::16-signed, 0, rest::binary>>, acc)) do
        deserialize(rest, %{acc | fetch_reverse: false})
      end
      defp(deserialize(<<8, 5::16-signed, value::32-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | fetch_size: value})
      end
      defp(deserialize(<<11, 6::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%ScrollCursorArgs{cursor_id: cursor_id, offset: offset, offset_is_absolute: offset_is_absolute, fetch_reverse: fetch_reverse, fetch_size: fetch_size, token: token})) do
        [case(cursor_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, cursor_id::64-signed>>
        end, case(offset) do
          nil ->
            <<>>
          _ ->
            <<8, 2::16-signed, offset::32-signed>>
        end, case(offset_is_absolute) do
          nil ->
            <<>>
          false ->
            <<2, 3::16-signed, 0>>
          true ->
            <<2, 3::16-signed, 1>>
          _ ->
            raise(Thrift.InvalidValueError, "Optional boolean field :offset_is_absolute on ScrollCursorArgs must be true, false, or nil")
        end, case(fetch_reverse) do
          nil ->
            <<>>
          false ->
            <<2, 4::16-signed, 0>>
          true ->
            <<2, 4::16-signed, 1>>
          _ ->
            raise(Thrift.InvalidValueError, "Optional boolean field :fetch_reverse on ScrollCursorArgs must be true, false, or nil")
        end, case(fetch_size) do
          nil ->
            <<>>
          _ ->
            <<8, 5::16-signed, fetch_size::32-signed>>
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 6::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(ExecuteUpdateArgs) do
    _ = "Auto-generated Thrift struct Elixir.ExecuteUpdateArgs"
    _ = "1: i64 conn_id"
    _ = "2: list<string> sqls"
    _ = "3: snappydata.StatementAttrs attrs"
    _ = "4: binary token"
    defstruct(conn_id: nil, sqls: nil, attrs: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %ExecuteUpdateArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %ExecuteUpdateArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | conn_id: value})
      end
      defp(deserialize(<<15, 2::16-signed, 11, remaining::32-signed, rest::binary>>, struct)) do
        deserialize__sqls(rest, [[], remaining, struct])
      end
      defp(deserialize(<<12, 3::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.StatementAttrs.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | attrs: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<11, 4::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      defp(deserialize__sqls(<<rest::binary>>, [list, 0, struct])) do
        deserialize(rest, %{struct | sqls: Enum.reverse(list)})
      end
      defp(deserialize__sqls(<<string_size::32-signed, element::binary-size(string_size), rest::binary>>, [list, remaining | stack])) do
        deserialize__sqls(rest, [[element | list], remaining - 1 | stack])
      end
      defp(deserialize__sqls(_, _)) do
        :error
      end
      def(serialize(%ExecuteUpdateArgs{conn_id: conn_id, sqls: sqls, attrs: attrs, token: token})) do
        [case(conn_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, conn_id::64-signed>>
        end, case(sqls) do
          nil ->
            <<>>
          _ ->
            [<<15, 2::16-signed, 11, length(sqls)::32-signed>> | for(e <- sqls) do
              [<<byte_size(e)::32-signed>> | e]
            end]
        end, case(attrs) do
          nil ->
            <<>>
          _ ->
            [<<12, 3::16-signed>> | Thrift.Generated.StatementAttrs.serialize(attrs)]
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 4::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(GetBestRowIdentifierArgs) do
    _ = "Auto-generated Thrift struct Elixir.GetBestRowIdentifierArgs"
    _ = "1: snappydata.ServiceMetaDataArgs metadata_args"
    _ = "2: i32 scope"
    _ = "3: bool nullable"
    defstruct(metadata_args: nil, scope: nil, nullable: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %GetBestRowIdentifierArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %GetBestRowIdentifierArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.ServiceMetaDataArgs.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | metadata_args: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<8, 2::16-signed, value::32-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | scope: value})
      end
      defp(deserialize(<<2, 3::16-signed, 1, rest::binary>>, acc)) do
        deserialize(rest, %{acc | nullable: true})
      end
      defp(deserialize(<<2, 3::16-signed, 0, rest::binary>>, acc)) do
        deserialize(rest, %{acc | nullable: false})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%GetBestRowIdentifierArgs{metadata_args: metadata_args, scope: scope, nullable: nullable})) do
        [case(metadata_args) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.ServiceMetaDataArgs.serialize(metadata_args)]
        end, case(scope) do
          nil ->
            <<>>
          _ ->
            <<8, 2::16-signed, scope::32-signed>>
        end, case(nullable) do
          nil ->
            <<>>
          false ->
            <<2, 3::16-signed, 0>>
          true ->
            <<2, 3::16-signed, 1>>
          _ ->
            raise(Thrift.InvalidValueError, "Optional boolean field :nullable on GetBestRowIdentifierArgs must be true, false, or nil")
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
  defmodule(CancelCurrentStatementArgs) do
    _ = "Auto-generated Thrift struct Elixir.CancelCurrentStatementArgs"
    _ = "1: i64 conn_id"
    _ = "2: binary token"
    defstruct(conn_id: nil, token: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %CancelCurrentStatementArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %CancelCurrentStatementArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 1::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | conn_id: value})
      end
      defp(deserialize(<<11, 2::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
        deserialize(rest, %{acc | token: value})
      end
      defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
        rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
      end
      defp(deserialize(_, _)) do
        :error
      end
      def(serialize(%CancelCurrentStatementArgs{conn_id: conn_id, token: token})) do
        [case(conn_id) do
          nil ->
            <<>>
          _ ->
            <<10, 1::16-signed, conn_id::64-signed>>
        end, case(token) do
          nil ->
            <<>>
          _ ->
            [<<11, 2::16-signed, byte_size(token)::32-signed>> | token]
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
  defmodule(GetSchemaMetaDataArgs) do
    _ = "Auto-generated Thrift struct Elixir.GetSchemaMetaDataArgs"
    _ = "1: snappydata.ServiceMetaDataCall schema_call"
    _ = "2: snappydata.ServiceMetaDataArgs metadata_args"
    defstruct(schema_call: nil, metadata_args: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %GetSchemaMetaDataArgs{})
      end
      defp(deserialize(<<0, rest::binary>>, %GetSchemaMetaDataArgs{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<8, 1::16-signed, value::32-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | schema_call: value})
      end
      defp(deserialize(<<12, 2::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.ServiceMetaDataArgs.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | metadata_args: value})
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
      def(serialize(%GetSchemaMetaDataArgs{schema_call: schema_call, metadata_args: metadata_args})) do
        [case(schema_call) do
          nil ->
            <<>>
          _ ->
            <<8, 1::16-signed, schema_call::32-signed>>
        end, case(metadata_args) do
          nil ->
            <<>>
          _ ->
            [<<12, 2::16-signed>> | Thrift.Generated.ServiceMetaDataArgs.serialize(metadata_args)]
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
  defmodule(GetPreferredServerResponse) do
    _ = "Auto-generated Thrift struct Elixir.GetPreferredServerResponse"
    _ = "0: snappydata.HostAddress success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %GetPreferredServerResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %GetPreferredServerResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 0::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.HostAddress.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | success: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%GetPreferredServerResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            [<<12, 0::16-signed>> | Thrift.Generated.HostAddress.serialize(success)]
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(CancelStatementResponse) do
    _ = "Auto-generated Thrift struct Elixir.CancelStatementResponse"
    _ = "0: void success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %CancelStatementResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %CancelStatementResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%CancelStatementResponse{error: error})) do
        [case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(GetClobChunkResponse) do
    _ = "Auto-generated Thrift struct Elixir.GetClobChunkResponse"
    _ = "0: snappydata.ClobChunk success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %GetClobChunkResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %GetClobChunkResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 0::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.ClobChunk.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | success: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%GetClobChunkResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            [<<12, 0::16-signed>> | Thrift.Generated.ClobChunk.serialize(success)]
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(RecoverXATransactionResponse) do
    _ = "Auto-generated Thrift struct Elixir.RecoverXATransactionResponse"
    _ = "0: list<snappydata.TransactionXid> success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %RecoverXATransactionResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %RecoverXATransactionResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<15, 0::16-signed, 12, remaining::32-signed, rest::binary>>, struct)) do
        deserialize__success(rest, [[], remaining, struct])
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      defp(deserialize__success(<<rest::binary>>, [list, 0, struct])) do
        deserialize(rest, %{struct | success: Enum.reverse(list)})
      end
      defp(deserialize__success(<<rest::binary>>, [list, remaining | stack])) do
        case(Elixir.Thrift.Generated.TransactionXid.BinaryProtocol.deserialize(rest)) do
          {element, rest} ->
            deserialize__success(rest, [[element | list], remaining - 1 | stack])
          :error ->
            :error
        end
      end
      defp(deserialize__success(_, _)) do
        :error
      end
      def(serialize(%RecoverXATransactionResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            [<<15, 0::16-signed, 12, length(success)::32-signed>> | for(e <- success) do
              Thrift.Generated.TransactionXid.serialize(e)
            end]
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(BeginTransactionResponse) do
    _ = "Auto-generated Thrift struct Elixir.BeginTransactionResponse"
    _ = "0: i8 success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %BeginTransactionResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %BeginTransactionResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<3, 0::16-signed, value::8-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | success: value})
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%BeginTransactionResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            <<3, 0::16-signed, success::8-signed>>
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(RollbackTransactionResponse) do
    _ = "Auto-generated Thrift struct Elixir.RollbackTransactionResponse"
    _ = "0: void success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %RollbackTransactionResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %RollbackTransactionResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%RollbackTransactionResponse{error: error})) do
        [case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(ExecutePreparedUpdateResponse) do
    _ = "Auto-generated Thrift struct Elixir.ExecutePreparedUpdateResponse"
    _ = "0: snappydata.UpdateResult success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %ExecutePreparedUpdateResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %ExecutePreparedUpdateResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 0::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.UpdateResult.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | success: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%ExecutePreparedUpdateResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            [<<12, 0::16-signed>> | Thrift.Generated.UpdateResult.serialize(success)]
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(FetchActiveStatementsResponse) do
    _ = "Auto-generated Thrift struct Elixir.FetchActiveStatementsResponse"
    _ = "0: map<i64,string> success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %FetchActiveStatementsResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %FetchActiveStatementsResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<13, 0::16-signed, 10, 11, map_size::32-signed, rest::binary>>, struct)) do
        deserialize__success__key(rest, [%{}, map_size, struct])
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      defp(deserialize__success__key(<<rest::binary>>, [map, 0, struct])) do
        deserialize(rest, %{struct | success: map})
      end
      defp(deserialize__success__key(<<key::64-signed, rest::binary>>, stack)) do
        deserialize__success__value(rest, key, stack)
      end
      defp(deserialize__success__key(_, _)) do
        :error
      end
      defp(deserialize__success__value(<<string_size::32-signed, value::binary-size(string_size), rest::binary>>, key, [map, remaining | stack])) do
        deserialize__success__key(rest, [Map.put(map, key, value), remaining - 1 | stack])
      end
      defp(deserialize__success__value(_, _, _)) do
        :error
      end
      def(serialize(%FetchActiveStatementsResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            [<<13, 0::16-signed, 10, 11, Enum.count(success)::32-signed>> | for({k, v} <- success) do
              [<<k::64-signed, byte_size(v)::32-signed>> | v]
            end]
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(OpenConnectionResponse) do
    _ = "Auto-generated Thrift struct Elixir.OpenConnectionResponse"
    _ = "0: snappydata.ConnectionProperties success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %OpenConnectionResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %OpenConnectionResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 0::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.ConnectionProperties.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | success: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%OpenConnectionResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            [<<12, 0::16-signed>> | Thrift.Generated.ConnectionProperties.serialize(success)]
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(GetBlobChunkResponse) do
    _ = "Auto-generated Thrift struct Elixir.GetBlobChunkResponse"
    _ = "0: snappydata.BlobChunk success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %GetBlobChunkResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %GetBlobChunkResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 0::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.BlobChunk.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | success: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%GetBlobChunkResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            [<<12, 0::16-signed>> | Thrift.Generated.BlobChunk.serialize(success)]
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(StartXATransactionResponse) do
    _ = "Auto-generated Thrift struct Elixir.StartXATransactionResponse"
    _ = "0: void success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %StartXATransactionResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %StartXATransactionResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%StartXATransactionResponse{error: error})) do
        [case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(GetUDTsResponse) do
    _ = "Auto-generated Thrift struct Elixir.GetUDTsResponse"
    _ = "0: snappydata.RowSet success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %GetUDTsResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %GetUDTsResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 0::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.RowSet.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | success: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%GetUDTsResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            [<<12, 0::16-signed>> | Thrift.Generated.RowSet.serialize(success)]
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(GetServiceMetaDataResponse) do
    _ = "Auto-generated Thrift struct Elixir.GetServiceMetaDataResponse"
    _ = "0: snappydata.ServiceMetaData success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %GetServiceMetaDataResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %GetServiceMetaDataResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 0::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.ServiceMetaData.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | success: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%GetServiceMetaDataResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            [<<12, 0::16-signed>> | Thrift.Generated.ServiceMetaData.serialize(success)]
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(PrepareXATransactionResponse) do
    _ = "Auto-generated Thrift struct Elixir.PrepareXATransactionResponse"
    _ = "0: i32 success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %PrepareXATransactionResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %PrepareXATransactionResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<8, 0::16-signed, value::32-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | success: value})
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%PrepareXATransactionResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            <<8, 0::16-signed, success::32-signed>>
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(ExecutePreparedQueryResponse) do
    _ = "Auto-generated Thrift struct Elixir.ExecutePreparedQueryResponse"
    _ = "0: snappydata.RowSet success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %ExecutePreparedQueryResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %ExecutePreparedQueryResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 0::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.RowSet.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | success: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%ExecutePreparedQueryResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            [<<12, 0::16-signed>> | Thrift.Generated.RowSet.serialize(success)]
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(GetAllServersWithPreferredServerResponse) do
    _ = "Auto-generated Thrift struct Elixir.GetAllServersWithPreferredServerResponse"
    _ = "0: list<snappydata.HostAddress> success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %GetAllServersWithPreferredServerResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %GetAllServersWithPreferredServerResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<15, 0::16-signed, 12, remaining::32-signed, rest::binary>>, struct)) do
        deserialize__success(rest, [[], remaining, struct])
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      defp(deserialize__success(<<rest::binary>>, [list, 0, struct])) do
        deserialize(rest, %{struct | success: Enum.reverse(list)})
      end
      defp(deserialize__success(<<rest::binary>>, [list, remaining | stack])) do
        case(Elixir.Thrift.Generated.HostAddress.BinaryProtocol.deserialize(rest)) do
          {element, rest} ->
            deserialize__success(rest, [[element | list], remaining - 1 | stack])
          :error ->
            :error
        end
      end
      defp(deserialize__success(_, _)) do
        :error
      end
      def(serialize(%GetAllServersWithPreferredServerResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            [<<15, 0::16-signed, 12, length(success)::32-signed>> | for(e <- success) do
              Thrift.Generated.HostAddress.serialize(e)
            end]
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(SendBlobChunkResponse) do
    _ = "Auto-generated Thrift struct Elixir.SendBlobChunkResponse"
    _ = "0: i64 success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %SendBlobChunkResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %SendBlobChunkResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 0::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | success: value})
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%SendBlobChunkResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            <<10, 0::16-signed, success::64-signed>>
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(EndXATransactionResponse) do
    _ = "Auto-generated Thrift struct Elixir.EndXATransactionResponse"
    _ = "0: void success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %EndXATransactionResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %EndXATransactionResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%EndXATransactionResponse{error: error})) do
        [case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(RollbackXATransactionResponse) do
    _ = "Auto-generated Thrift struct Elixir.RollbackXATransactionResponse"
    _ = "0: void success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %RollbackXATransactionResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %RollbackXATransactionResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%RollbackXATransactionResponse{error: error})) do
        [case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(PrepareStatementResponse) do
    _ = "Auto-generated Thrift struct Elixir.PrepareStatementResponse"
    _ = "0: snappydata.PrepareResult success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %PrepareStatementResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %PrepareStatementResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 0::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.PrepareResult.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | success: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%PrepareStatementResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            [<<12, 0::16-signed>> | Thrift.Generated.PrepareResult.serialize(success)]
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(CommitXATransactionResponse) do
    _ = "Auto-generated Thrift struct Elixir.CommitXATransactionResponse"
    _ = "0: void success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %CommitXATransactionResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %CommitXATransactionResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%CommitXATransactionResponse{error: error})) do
        [case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(ExecuteCursorUpdateResponse) do
    _ = "Auto-generated Thrift struct Elixir.ExecuteCursorUpdateResponse"
    _ = "0: void success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %ExecuteCursorUpdateResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %ExecuteCursorUpdateResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%ExecuteCursorUpdateResponse{error: error})) do
        [case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(SetTransactionAttributesResponse) do
    _ = "Auto-generated Thrift struct Elixir.SetTransactionAttributesResponse"
    _ = "0: void success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %SetTransactionAttributesResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %SetTransactionAttributesResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%SetTransactionAttributesResponse{error: error})) do
        [case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(ExecutePreparedBatchResponse) do
    _ = "Auto-generated Thrift struct Elixir.ExecutePreparedBatchResponse"
    _ = "0: snappydata.UpdateResult success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %ExecutePreparedBatchResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %ExecutePreparedBatchResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 0::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.UpdateResult.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | success: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%ExecutePreparedBatchResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            [<<12, 0::16-signed>> | Thrift.Generated.UpdateResult.serialize(success)]
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(FreeLobResponse) do
    _ = "Auto-generated Thrift struct Elixir.FreeLobResponse"
    _ = "0: void success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %FreeLobResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %FreeLobResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%FreeLobResponse{error: error})) do
        [case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(GetNextResultSetResponse) do
    _ = "Auto-generated Thrift struct Elixir.GetNextResultSetResponse"
    _ = "0: snappydata.RowSet success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %GetNextResultSetResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %GetNextResultSetResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 0::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.RowSet.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | success: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%GetNextResultSetResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            [<<12, 0::16-signed>> | Thrift.Generated.RowSet.serialize(success)]
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(FetchActiveConnectionsResponse) do
    _ = "Auto-generated Thrift struct Elixir.FetchActiveConnectionsResponse"
    _ = "0: list<snappydata.ConnectionProperties> success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %FetchActiveConnectionsResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %FetchActiveConnectionsResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<15, 0::16-signed, 12, remaining::32-signed, rest::binary>>, struct)) do
        deserialize__success(rest, [[], remaining, struct])
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      defp(deserialize__success(<<rest::binary>>, [list, 0, struct])) do
        deserialize(rest, %{struct | success: Enum.reverse(list)})
      end
      defp(deserialize__success(<<rest::binary>>, [list, remaining | stack])) do
        case(Elixir.Thrift.Generated.ConnectionProperties.BinaryProtocol.deserialize(rest)) do
          {element, rest} ->
            deserialize__success(rest, [[element | list], remaining - 1 | stack])
          :error ->
            :error
        end
      end
      defp(deserialize__success(_, _)) do
        :error
      end
      def(serialize(%FetchActiveConnectionsResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            [<<15, 0::16-signed, 12, length(success)::32-signed>> | for(e <- success) do
              Thrift.Generated.ConnectionProperties.serialize(e)
            end]
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(ExecuteResponse) do
    _ = "Auto-generated Thrift struct Elixir.ExecuteResponse"
    _ = "0: snappydata.StatementResult success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %ExecuteResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %ExecuteResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 0::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.StatementResult.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | success: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%ExecuteResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            [<<12, 0::16-signed>> | Thrift.Generated.StatementResult.serialize(success)]
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(ExecuteQueryResponse) do
    _ = "Auto-generated Thrift struct Elixir.ExecuteQueryResponse"
    _ = "0: snappydata.RowSet success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %ExecuteQueryResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %ExecuteQueryResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 0::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.RowSet.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | success: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%ExecuteQueryResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            [<<12, 0::16-signed>> | Thrift.Generated.RowSet.serialize(success)]
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(GetTransactionAttributesResponse) do
    _ = "Auto-generated Thrift struct Elixir.GetTransactionAttributesResponse"
    _ = "0: map<snappydata.TransactionAttribute,bool> success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %GetTransactionAttributesResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %GetTransactionAttributesResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<13, 0::16-signed, 8, 2, map_size::32-signed, rest::binary>>, struct)) do
        deserialize__success__key(rest, [%{}, map_size, struct])
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      defp(deserialize__success__key(<<rest::binary>>, [map, 0, struct])) do
        deserialize(rest, %{struct | success: map})
      end
      defp(deserialize__success__key(<<key::32-signed, rest::binary>>, stack)) do
        deserialize__success__value(rest, key, stack)
      end
      defp(deserialize__success__key(_, _)) do
        :error
      end
      defp(deserialize__success__value(<<0, rest::binary>>, key, [map, remaining | stack])) do
        deserialize__success__key(rest, [Map.put(map, key, false), remaining - 1 | stack])
      end
      defp(deserialize__success__value(<<1, rest::binary>>, key, [map, remaining | stack])) do
        deserialize__success__key(rest, [Map.put(map, key, true), remaining - 1 | stack])
      end
      defp(deserialize__success__value(_, _, _)) do
        :error
      end
      def(serialize(%GetTransactionAttributesResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            [<<13, 0::16-signed, 8, 2, Enum.count(success)::32-signed>> | for({k, v} <- success) do
              [<<k::32-signed>> | case(v) do
                nil ->
                  <<0>>
                false ->
                  <<0>>
                _ ->
                  <<1>>
              end]
            end]
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(SendClobChunkResponse) do
    _ = "Auto-generated Thrift struct Elixir.SendClobChunkResponse"
    _ = "0: i64 success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %SendClobChunkResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %SendClobChunkResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<10, 0::16-signed, value::64-signed, rest::binary>>, acc)) do
        deserialize(rest, %{acc | success: value})
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%SendClobChunkResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            <<10, 0::16-signed, success::64-signed>>
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(CloseResultSetResponse) do
    _ = "Auto-generated Thrift struct Elixir.CloseResultSetResponse"
    _ = "0: void success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %CloseResultSetResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %CloseResultSetResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%CloseResultSetResponse{error: error})) do
        [case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(ExecutePreparedResponse) do
    _ = "Auto-generated Thrift struct Elixir.ExecutePreparedResponse"
    _ = "0: snappydata.StatementResult success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %ExecutePreparedResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %ExecutePreparedResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 0::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.StatementResult.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | success: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%ExecutePreparedResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            [<<12, 0::16-signed>> | Thrift.Generated.StatementResult.serialize(success)]
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(CloseStatementResponse) do
    _ = "Auto-generated Thrift struct Elixir.CloseStatementResponse"
    _ = "0: void success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %CloseStatementResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %CloseStatementResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%CloseStatementResponse{error: error})) do
        [case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(CommitTransactionResponse) do
    _ = "Auto-generated Thrift struct Elixir.CommitTransactionResponse"
    _ = "0: void success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %CommitTransactionResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %CommitTransactionResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%CommitTransactionResponse{error: error})) do
        [case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(PrepareAndExecuteResponse) do
    _ = "Auto-generated Thrift struct Elixir.PrepareAndExecuteResponse"
    _ = "0: snappydata.StatementResult success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %PrepareAndExecuteResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %PrepareAndExecuteResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 0::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.StatementResult.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | success: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%PrepareAndExecuteResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            [<<12, 0::16-signed>> | Thrift.Generated.StatementResult.serialize(success)]
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(ForgetXATransactionResponse) do
    _ = "Auto-generated Thrift struct Elixir.ForgetXATransactionResponse"
    _ = "0: void success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %ForgetXATransactionResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %ForgetXATransactionResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%ForgetXATransactionResponse{error: error})) do
        [case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(GetIndexInfoResponse) do
    _ = "Auto-generated Thrift struct Elixir.GetIndexInfoResponse"
    _ = "0: snappydata.RowSet success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %GetIndexInfoResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %GetIndexInfoResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 0::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.RowSet.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | success: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%GetIndexInfoResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            [<<12, 0::16-signed>> | Thrift.Generated.RowSet.serialize(success)]
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(ScrollCursorResponse) do
    _ = "Auto-generated Thrift struct Elixir.ScrollCursorResponse"
    _ = "0: snappydata.RowSet success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %ScrollCursorResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %ScrollCursorResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 0::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.RowSet.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | success: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%ScrollCursorResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            [<<12, 0::16-signed>> | Thrift.Generated.RowSet.serialize(success)]
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(ExecuteUpdateResponse) do
    _ = "Auto-generated Thrift struct Elixir.ExecuteUpdateResponse"
    _ = "0: snappydata.UpdateResult success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %ExecuteUpdateResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %ExecuteUpdateResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 0::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.UpdateResult.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | success: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%ExecuteUpdateResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            [<<12, 0::16-signed>> | Thrift.Generated.UpdateResult.serialize(success)]
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(GetBestRowIdentifierResponse) do
    _ = "Auto-generated Thrift struct Elixir.GetBestRowIdentifierResponse"
    _ = "0: snappydata.RowSet success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %GetBestRowIdentifierResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %GetBestRowIdentifierResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 0::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.RowSet.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | success: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%GetBestRowIdentifierResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            [<<12, 0::16-signed>> | Thrift.Generated.RowSet.serialize(success)]
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(CancelCurrentStatementResponse) do
    _ = "Auto-generated Thrift struct Elixir.CancelCurrentStatementResponse"
    _ = "0: void success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %CancelCurrentStatementResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %CancelCurrentStatementResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%CancelCurrentStatementResponse{error: error})) do
        [case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(GetSchemaMetaDataResponse) do
    _ = "Auto-generated Thrift struct Elixir.GetSchemaMetaDataResponse"
    _ = "0: snappydata.RowSet success"
    _ = "1: snappydata.SnappyException error"
    defstruct(success: nil, error: nil)
    @type(t :: %__MODULE__{})
    def(new) do
      %__MODULE__{}
    end
    defmodule(BinaryProtocol) do
      @moduledoc(false)
      def(deserialize(binary)) do
        deserialize(binary, %GetSchemaMetaDataResponse{})
      end
      defp(deserialize(<<0, rest::binary>>, %GetSchemaMetaDataResponse{} = acc)) do
        {acc, rest}
      end
      defp(deserialize(<<12, 0::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.RowSet.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | success: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.Thrift.Generated.SnappyException.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | error: value})
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
      def(serialize(%GetSchemaMetaDataResponse{success: success, error: error})) do
        [case(success) do
          nil ->
            <<>>
          _ ->
            [<<12, 0::16-signed>> | Thrift.Generated.RowSet.serialize(success)]
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | Thrift.Generated.SnappyException.serialize(error)]
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
  defmodule(Binary.Framed.Client) do
    @moduledoc(false)
    alias(Thrift.Binary.Framed.Client, as: ClientImpl)
    defdelegate(close(conn), to: ClientImpl)
    defdelegate(connect(conn, opts), to: ClientImpl)
    defdelegate(start_link(host, port, opts \\ []), to: ClientImpl)
    def(unquote(:get_preferred_server)(client, server_types, server_groups, failed_servers, rpc_opts \\ [])) do
      args = %GetPreferredServerArgs{server_types: server_types, server_groups: server_groups, failed_servers: failed_servers}
      serialized_args = GetPreferredServerArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "getPreferredServer", serialized_args, GetPreferredServerResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:get_preferred_server!)(client, server_types, server_groups, failed_servers, rpc_opts \\ [])) do
      case(unquote(:get_preferred_server)(client, server_types, server_groups, failed_servers, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:cancel_statement)(client, stmt_id, token, rpc_opts \\ [])) do
      args = %CancelStatementArgs{stmt_id: stmt_id, token: token}
      serialized_args = CancelStatementArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "cancelStatement", serialized_args, CancelStatementResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:cancel_statement!)(client, stmt_id, token, rpc_opts \\ [])) do
      case(unquote(:cancel_statement)(client, stmt_id, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:get_clob_chunk)(client, conn_id, lob_id, offset, size, free_lob_at_end, token, rpc_opts \\ [])) do
      args = %GetClobChunkArgs{conn_id: conn_id, lob_id: lob_id, offset: offset, size: size, free_lob_at_end: free_lob_at_end, token: token}
      serialized_args = GetClobChunkArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "getClobChunk", serialized_args, GetClobChunkResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:get_clob_chunk!)(client, conn_id, lob_id, offset, size, free_lob_at_end, token, rpc_opts \\ [])) do
      case(unquote(:get_clob_chunk)(client, conn_id, lob_id, offset, size, free_lob_at_end, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:recover_xa_transaction)(client, conn_id, flag, token, rpc_opts \\ [])) do
      args = %RecoverXATransactionArgs{conn_id: conn_id, flag: flag, token: token}
      serialized_args = RecoverXATransactionArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "recoverXATransaction", serialized_args, RecoverXATransactionResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:recover_xa_transaction!)(client, conn_id, flag, token, rpc_opts \\ [])) do
      case(unquote(:recover_xa_transaction)(client, conn_id, flag, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:begin_transaction)(client, conn_id, isolation_level, flags, token, rpc_opts \\ [])) do
      args = %BeginTransactionArgs{conn_id: conn_id, isolation_level: isolation_level, flags: flags, token: token}
      serialized_args = BeginTransactionArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "beginTransaction", serialized_args, BeginTransactionResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:begin_transaction!)(client, conn_id, isolation_level, flags, token, rpc_opts \\ [])) do
      case(unquote(:begin_transaction)(client, conn_id, isolation_level, flags, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:rollback_transaction)(client, conn_id, start_new_transaction, flags, token, rpc_opts \\ [])) do
      args = %RollbackTransactionArgs{conn_id: conn_id, start_new_transaction: start_new_transaction, flags: flags, token: token}
      serialized_args = RollbackTransactionArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "rollbackTransaction", serialized_args, RollbackTransactionResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:rollback_transaction!)(client, conn_id, start_new_transaction, flags, token, rpc_opts \\ [])) do
      case(unquote(:rollback_transaction)(client, conn_id, start_new_transaction, flags, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:execute_prepared_update)(client, stmt_id, params, attrs, token, rpc_opts \\ [])) do
      args = %ExecutePreparedUpdateArgs{stmt_id: stmt_id, params: params, attrs: attrs, token: token}
      serialized_args = ExecutePreparedUpdateArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "executePreparedUpdate", serialized_args, ExecutePreparedUpdateResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:execute_prepared_update!)(client, stmt_id, params, attrs, token, rpc_opts \\ [])) do
      case(unquote(:execute_prepared_update)(client, stmt_id, params, attrs, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:fetch_active_statements)(client, conn_id, token, rpc_opts \\ [])) do
      args = %FetchActiveStatementsArgs{conn_id: conn_id, token: token}
      serialized_args = FetchActiveStatementsArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "fetchActiveStatements", serialized_args, FetchActiveStatementsResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:fetch_active_statements!)(client, conn_id, token, rpc_opts \\ [])) do
      case(unquote(:fetch_active_statements)(client, conn_id, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:open_connection)(client, arguments, rpc_opts \\ [])) do
      args = %OpenConnectionArgs{arguments: arguments}
      serialized_args = OpenConnectionArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "openConnection", serialized_args, OpenConnectionResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:open_connection!)(client, arguments, rpc_opts \\ [])) do
      case(unquote(:open_connection)(client, arguments, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:get_blob_chunk)(client, conn_id, lob_id, offset, size, free_lob_at_end, token, rpc_opts \\ [])) do
      args = %GetBlobChunkArgs{conn_id: conn_id, lob_id: lob_id, offset: offset, size: size, free_lob_at_end: free_lob_at_end, token: token}
      serialized_args = GetBlobChunkArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "getBlobChunk", serialized_args, GetBlobChunkResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:get_blob_chunk!)(client, conn_id, lob_id, offset, size, free_lob_at_end, token, rpc_opts \\ [])) do
      case(unquote(:get_blob_chunk)(client, conn_id, lob_id, offset, size, free_lob_at_end, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:start_xa_transaction)(client, conn_id, xid, timeout_in_seconds, flags, token, rpc_opts \\ [])) do
      args = %StartXATransactionArgs{conn_id: conn_id, xid: xid, timeout_in_seconds: timeout_in_seconds, flags: flags, token: token}
      serialized_args = StartXATransactionArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "startXATransaction", serialized_args, StartXATransactionResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:start_xa_transaction!)(client, conn_id, xid, timeout_in_seconds, flags, token, rpc_opts \\ [])) do
      case(unquote(:start_xa_transaction)(client, conn_id, xid, timeout_in_seconds, flags, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:get_ud_ts)(client, metadata_args, types, rpc_opts \\ [])) do
      args = %GetUDTsArgs{metadata_args: metadata_args, types: types}
      serialized_args = GetUDTsArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "getUDTs", serialized_args, GetUDTsResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:get_ud_ts!)(client, metadata_args, types, rpc_opts \\ [])) do
      case(unquote(:get_ud_ts)(client, metadata_args, types, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:get_service_meta_data)(client, conn_id, token, rpc_opts \\ [])) do
      args = %GetServiceMetaDataArgs{conn_id: conn_id, token: token}
      serialized_args = GetServiceMetaDataArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "getServiceMetaData", serialized_args, GetServiceMetaDataResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:get_service_meta_data!)(client, conn_id, token, rpc_opts \\ [])) do
      case(unquote(:get_service_meta_data)(client, conn_id, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:prepare_xa_transaction)(client, conn_id, xid, token, rpc_opts \\ [])) do
      args = %PrepareXATransactionArgs{conn_id: conn_id, xid: xid, token: token}
      serialized_args = PrepareXATransactionArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "prepareXATransaction", serialized_args, PrepareXATransactionResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:prepare_xa_transaction!)(client, conn_id, xid, token, rpc_opts \\ [])) do
      case(unquote(:prepare_xa_transaction)(client, conn_id, xid, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:execute_prepared_query)(client, stmt_id, params, attrs, token, rpc_opts \\ [])) do
      args = %ExecutePreparedQueryArgs{stmt_id: stmt_id, params: params, attrs: attrs, token: token}
      serialized_args = ExecutePreparedQueryArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "executePreparedQuery", serialized_args, ExecutePreparedQueryResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:execute_prepared_query!)(client, stmt_id, params, attrs, token, rpc_opts \\ [])) do
      case(unquote(:execute_prepared_query)(client, stmt_id, params, attrs, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:get_all_servers_with_preferred_server)(client, server_types, server_groups, failed_servers, rpc_opts \\ [])) do
      args = %GetAllServersWithPreferredServerArgs{server_types: server_types, server_groups: server_groups, failed_servers: failed_servers}
      serialized_args = GetAllServersWithPreferredServerArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "getAllServersWithPreferredServer", serialized_args, GetAllServersWithPreferredServerResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:get_all_servers_with_preferred_server!)(client, server_types, server_groups, failed_servers, rpc_opts \\ [])) do
      case(unquote(:get_all_servers_with_preferred_server)(client, server_types, server_groups, failed_servers, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:send_blob_chunk)(client, chunk, conn_id, token, rpc_opts \\ [])) do
      args = %SendBlobChunkArgs{chunk: chunk, conn_id: conn_id, token: token}
      serialized_args = SendBlobChunkArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "sendBlobChunk", serialized_args, SendBlobChunkResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:send_blob_chunk!)(client, chunk, conn_id, token, rpc_opts \\ [])) do
      case(unquote(:send_blob_chunk)(client, chunk, conn_id, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:end_xa_transaction)(client, conn_id, xid, flags, token, rpc_opts \\ [])) do
      args = %EndXATransactionArgs{conn_id: conn_id, xid: xid, flags: flags, token: token}
      serialized_args = EndXATransactionArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "endXATransaction", serialized_args, EndXATransactionResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:end_xa_transaction!)(client, conn_id, xid, flags, token, rpc_opts \\ [])) do
      case(unquote(:end_xa_transaction)(client, conn_id, xid, flags, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:rollback_xa_transaction)(client, conn_id, xid, token, rpc_opts \\ [])) do
      args = %RollbackXATransactionArgs{conn_id: conn_id, xid: xid, token: token}
      serialized_args = RollbackXATransactionArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "rollbackXATransaction", serialized_args, RollbackXATransactionResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:rollback_xa_transaction!)(client, conn_id, xid, token, rpc_opts \\ [])) do
      case(unquote(:rollback_xa_transaction)(client, conn_id, xid, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:bulk_close)(client, entities, rpc_opts \\ [])) do
      args = %BulkCloseArgs{entities: entities}
      serialized_args = BulkCloseArgs.BinaryProtocol.serialize(args)
      (
        :ok = ClientImpl.oneway(client, "bulkClose", serialized_args, rpc_opts)
        {:ok, nil}
      )
    end
    def(unquote(:bulk_close!)(client, entities, rpc_opts \\ [])) do
      case(unquote(:bulk_close)(client, entities, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:prepare_statement)(client, conn_id, sql, output_params, attrs, token, rpc_opts \\ [])) do
      args = %PrepareStatementArgs{conn_id: conn_id, sql: sql, output_params: output_params, attrs: attrs, token: token}
      serialized_args = PrepareStatementArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "prepareStatement", serialized_args, PrepareStatementResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:prepare_statement!)(client, conn_id, sql, output_params, attrs, token, rpc_opts \\ [])) do
      case(unquote(:prepare_statement)(client, conn_id, sql, output_params, attrs, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:commit_xa_transaction)(client, conn_id, xid, one_phase, token, rpc_opts \\ [])) do
      args = %CommitXATransactionArgs{conn_id: conn_id, xid: xid, one_phase: one_phase, token: token}
      serialized_args = CommitXATransactionArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "commitXATransaction", serialized_args, CommitXATransactionResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:commit_xa_transaction!)(client, conn_id, xid, one_phase, token, rpc_opts \\ [])) do
      case(unquote(:commit_xa_transaction)(client, conn_id, xid, one_phase, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:execute_cursor_update)(client, cursor_id, operations, changed_rows, changed_columns_list, changed_row_indexes, token, rpc_opts \\ [])) do
      args = %ExecuteCursorUpdateArgs{cursor_id: cursor_id, operations: operations, changed_rows: changed_rows, changed_columns_list: changed_columns_list, changed_row_indexes: changed_row_indexes, token: token}
      serialized_args = ExecuteCursorUpdateArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "executeCursorUpdate", serialized_args, ExecuteCursorUpdateResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:execute_cursor_update!)(client, cursor_id, operations, changed_rows, changed_columns_list, changed_row_indexes, token, rpc_opts \\ [])) do
      case(unquote(:execute_cursor_update)(client, cursor_id, operations, changed_rows, changed_columns_list, changed_row_indexes, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:set_transaction_attributes)(client, conn_id, flags, token, rpc_opts \\ [])) do
      args = %SetTransactionAttributesArgs{conn_id: conn_id, flags: flags, token: token}
      serialized_args = SetTransactionAttributesArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "setTransactionAttributes", serialized_args, SetTransactionAttributesResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:set_transaction_attributes!)(client, conn_id, flags, token, rpc_opts \\ [])) do
      case(unquote(:set_transaction_attributes)(client, conn_id, flags, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:execute_prepared_batch)(client, stmt_id, params_batch, attrs, token, rpc_opts \\ [])) do
      args = %ExecutePreparedBatchArgs{stmt_id: stmt_id, params_batch: params_batch, attrs: attrs, token: token}
      serialized_args = ExecutePreparedBatchArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "executePreparedBatch", serialized_args, ExecutePreparedBatchResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:execute_prepared_batch!)(client, stmt_id, params_batch, attrs, token, rpc_opts \\ [])) do
      case(unquote(:execute_prepared_batch)(client, stmt_id, params_batch, attrs, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:free_lob)(client, conn_id, lob_id, token, rpc_opts \\ [])) do
      args = %FreeLobArgs{conn_id: conn_id, lob_id: lob_id, token: token}
      serialized_args = FreeLobArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "freeLob", serialized_args, FreeLobResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:free_lob!)(client, conn_id, lob_id, token, rpc_opts \\ [])) do
      case(unquote(:free_lob)(client, conn_id, lob_id, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:get_next_result_set)(client, cursor_id, other_result_set_behaviour, token, rpc_opts \\ [])) do
      args = %GetNextResultSetArgs{cursor_id: cursor_id, other_result_set_behaviour: other_result_set_behaviour, token: token}
      serialized_args = GetNextResultSetArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "getNextResultSet", serialized_args, GetNextResultSetResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:get_next_result_set!)(client, cursor_id, other_result_set_behaviour, token, rpc_opts \\ [])) do
      case(unquote(:get_next_result_set)(client, cursor_id, other_result_set_behaviour, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:fetch_active_connections)(client, conn_id, token, rpc_opts \\ [])) do
      args = %FetchActiveConnectionsArgs{conn_id: conn_id, token: token}
      serialized_args = FetchActiveConnectionsArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "fetchActiveConnections", serialized_args, FetchActiveConnectionsResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:fetch_active_connections!)(client, conn_id, token, rpc_opts \\ [])) do
      case(unquote(:fetch_active_connections)(client, conn_id, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:close_connection)(client, conn_id, close_socket, token, rpc_opts \\ [])) do
      args = %CloseConnectionArgs{conn_id: conn_id, close_socket: close_socket, token: token}
      serialized_args = CloseConnectionArgs.BinaryProtocol.serialize(args)
      (
        :ok = ClientImpl.oneway(client, "closeConnection", serialized_args, rpc_opts)
        {:ok, nil}
      )
    end
    def(unquote(:close_connection!)(client, conn_id, close_socket, token, rpc_opts \\ [])) do
      case(unquote(:close_connection)(client, conn_id, close_socket, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:execute)(client, conn_id, sql, output_params, attrs, token, rpc_opts \\ [])) do
      args = %ExecuteArgs{conn_id: conn_id, sql: sql, output_params: output_params, attrs: attrs, token: token}
      serialized_args = ExecuteArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "execute", serialized_args, ExecuteResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:execute!)(client, conn_id, sql, output_params, attrs, token, rpc_opts \\ [])) do
      case(unquote(:execute)(client, conn_id, sql, output_params, attrs, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:execute_query)(client, conn_id, sql, attrs, token, rpc_opts \\ [])) do
      args = %ExecuteQueryArgs{conn_id: conn_id, sql: sql, attrs: attrs, token: token}
      serialized_args = ExecuteQueryArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "executeQuery", serialized_args, ExecuteQueryResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:execute_query!)(client, conn_id, sql, attrs, token, rpc_opts \\ [])) do
      case(unquote(:execute_query)(client, conn_id, sql, attrs, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:get_transaction_attributes)(client, conn_id, token, rpc_opts \\ [])) do
      args = %GetTransactionAttributesArgs{conn_id: conn_id, token: token}
      serialized_args = GetTransactionAttributesArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "getTransactionAttributes", serialized_args, GetTransactionAttributesResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:get_transaction_attributes!)(client, conn_id, token, rpc_opts \\ [])) do
      case(unquote(:get_transaction_attributes)(client, conn_id, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:send_clob_chunk)(client, chunk, conn_id, token, rpc_opts \\ [])) do
      args = %SendClobChunkArgs{chunk: chunk, conn_id: conn_id, token: token}
      serialized_args = SendClobChunkArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "sendClobChunk", serialized_args, SendClobChunkResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:send_clob_chunk!)(client, chunk, conn_id, token, rpc_opts \\ [])) do
      case(unquote(:send_clob_chunk)(client, chunk, conn_id, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:close_result_set)(client, cursor_id, token, rpc_opts \\ [])) do
      args = %CloseResultSetArgs{cursor_id: cursor_id, token: token}
      serialized_args = CloseResultSetArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "closeResultSet", serialized_args, CloseResultSetResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:close_result_set!)(client, cursor_id, token, rpc_opts \\ [])) do
      case(unquote(:close_result_set)(client, cursor_id, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:execute_prepared)(client, stmt_id, params, output_params, attrs, token, rpc_opts \\ [])) do
      args = %ExecutePreparedArgs{stmt_id: stmt_id, params: params, output_params: output_params, attrs: attrs, token: token}
      serialized_args = ExecutePreparedArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "executePrepared", serialized_args, ExecutePreparedResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:execute_prepared!)(client, stmt_id, params, output_params, attrs, token, rpc_opts \\ [])) do
      case(unquote(:execute_prepared)(client, stmt_id, params, output_params, attrs, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:close_statement)(client, stmt_id, token, rpc_opts \\ [])) do
      args = %CloseStatementArgs{stmt_id: stmt_id, token: token}
      serialized_args = CloseStatementArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "closeStatement", serialized_args, CloseStatementResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:close_statement!)(client, stmt_id, token, rpc_opts \\ [])) do
      case(unquote(:close_statement)(client, stmt_id, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:commit_transaction)(client, conn_id, start_new_transaction, flags, token, rpc_opts \\ [])) do
      args = %CommitTransactionArgs{conn_id: conn_id, start_new_transaction: start_new_transaction, flags: flags, token: token}
      serialized_args = CommitTransactionArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "commitTransaction", serialized_args, CommitTransactionResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:commit_transaction!)(client, conn_id, start_new_transaction, flags, token, rpc_opts \\ [])) do
      case(unquote(:commit_transaction)(client, conn_id, start_new_transaction, flags, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:prepare_and_execute)(client, conn_id, sql, params_batch, output_params, attrs, token, rpc_opts \\ [])) do
      args = %PrepareAndExecuteArgs{conn_id: conn_id, sql: sql, params_batch: params_batch, output_params: output_params, attrs: attrs, token: token}
      serialized_args = PrepareAndExecuteArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "prepareAndExecute", serialized_args, PrepareAndExecuteResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:prepare_and_execute!)(client, conn_id, sql, params_batch, output_params, attrs, token, rpc_opts \\ [])) do
      case(unquote(:prepare_and_execute)(client, conn_id, sql, params_batch, output_params, attrs, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:forget_xa_transaction)(client, conn_id, xid, token, rpc_opts \\ [])) do
      args = %ForgetXATransactionArgs{conn_id: conn_id, xid: xid, token: token}
      serialized_args = ForgetXATransactionArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "forgetXATransaction", serialized_args, ForgetXATransactionResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:forget_xa_transaction!)(client, conn_id, xid, token, rpc_opts \\ [])) do
      case(unquote(:forget_xa_transaction)(client, conn_id, xid, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:get_index_info)(client, metadata_args, unique, approximate, rpc_opts \\ [])) do
      args = %GetIndexInfoArgs{metadata_args: metadata_args, unique: unique, approximate: approximate}
      serialized_args = GetIndexInfoArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "getIndexInfo", serialized_args, GetIndexInfoResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:get_index_info!)(client, metadata_args, unique, approximate, rpc_opts \\ [])) do
      case(unquote(:get_index_info)(client, metadata_args, unique, approximate, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:scroll_cursor)(client, cursor_id, offset, offset_is_absolute, fetch_reverse, fetch_size, token, rpc_opts \\ [])) do
      args = %ScrollCursorArgs{cursor_id: cursor_id, offset: offset, offset_is_absolute: offset_is_absolute, fetch_reverse: fetch_reverse, fetch_size: fetch_size, token: token}
      serialized_args = ScrollCursorArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "scrollCursor", serialized_args, ScrollCursorResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:scroll_cursor!)(client, cursor_id, offset, offset_is_absolute, fetch_reverse, fetch_size, token, rpc_opts \\ [])) do
      case(unquote(:scroll_cursor)(client, cursor_id, offset, offset_is_absolute, fetch_reverse, fetch_size, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:execute_update)(client, conn_id, sqls, attrs, token, rpc_opts \\ [])) do
      args = %ExecuteUpdateArgs{conn_id: conn_id, sqls: sqls, attrs: attrs, token: token}
      serialized_args = ExecuteUpdateArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "executeUpdate", serialized_args, ExecuteUpdateResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:execute_update!)(client, conn_id, sqls, attrs, token, rpc_opts \\ [])) do
      case(unquote(:execute_update)(client, conn_id, sqls, attrs, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:get_best_row_identifier)(client, metadata_args, scope, nullable, rpc_opts \\ [])) do
      args = %GetBestRowIdentifierArgs{metadata_args: metadata_args, scope: scope, nullable: nullable}
      serialized_args = GetBestRowIdentifierArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "getBestRowIdentifier", serialized_args, GetBestRowIdentifierResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:get_best_row_identifier!)(client, metadata_args, scope, nullable, rpc_opts \\ [])) do
      case(unquote(:get_best_row_identifier)(client, metadata_args, scope, nullable, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:cancel_current_statement)(client, conn_id, token, rpc_opts \\ [])) do
      args = %CancelCurrentStatementArgs{conn_id: conn_id, token: token}
      serialized_args = CancelCurrentStatementArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "cancelCurrentStatement", serialized_args, CancelCurrentStatementResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:cancel_current_statement!)(client, conn_id, token, rpc_opts \\ [])) do
      case(unquote(:cancel_current_statement)(client, conn_id, token, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(unquote(:get_schema_meta_data)(client, schema_call, metadata_args, rpc_opts \\ [])) do
      args = %GetSchemaMetaDataArgs{schema_call: schema_call, metadata_args: metadata_args}
      serialized_args = GetSchemaMetaDataArgs.BinaryProtocol.serialize(args)
      ClientImpl.call(client, "getSchemaMetaData", serialized_args, GetSchemaMetaDataResponse.BinaryProtocol, rpc_opts)
    end
    def(unquote(:get_schema_meta_data!)(client, schema_call, metadata_args, rpc_opts \\ [])) do
      case(unquote(:get_schema_meta_data)(client, schema_call, metadata_args, rpc_opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
  end
  defmodule(Binary.Framed.Server) do
    @moduledoc(false)
    require(Logger)
    alias(Thrift.Binary.Framed.Server, as: ServerImpl)
    defdelegate(stop(name), to: ServerImpl)
    def(start_link(handler_module, port, opts \\ [])) do
      ServerImpl.start_link(__MODULE__, port, handler_module, opts)
    end
    def(handle_thrift("getPreferredServer", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.GetPreferredServerArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.GetPreferredServerArgs{server_types: server_types, server_groups: server_groups, failed_servers: failed_servers}, ""} ->
          try() do
            rsp = handler_module.get_preferred_server(server_types, server_groups, failed_servers)
            (
              response = %Thrift.Generated.SnappyDataService.GetPreferredServerResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.GetPreferredServerResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.GetPreferredServerResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.GetPreferredServerResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("cancelStatement", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.CancelStatementArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.CancelStatementArgs{stmt_id: stmt_id, token: token}, ""} ->
          try() do
            rsp = handler_module.cancel_statement(stmt_id, token)
            (
              _ = rsp
              :noreply
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.CancelStatementResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.CancelStatementResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("getClobChunk", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.GetClobChunkArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.GetClobChunkArgs{conn_id: conn_id, lob_id: lob_id, offset: offset, size: size, free_lob_at_end: free_lob_at_end, token: token}, ""} ->
          try() do
            rsp = handler_module.get_clob_chunk(conn_id, lob_id, offset, size, free_lob_at_end, token)
            (
              response = %Thrift.Generated.SnappyDataService.GetClobChunkResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.GetClobChunkResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.GetClobChunkResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.GetClobChunkResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("recoverXATransaction", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.RecoverXATransactionArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.RecoverXATransactionArgs{conn_id: conn_id, flag: flag, token: token}, ""} ->
          try() do
            rsp = handler_module.recover_xa_transaction(conn_id, flag, token)
            (
              response = %Thrift.Generated.SnappyDataService.RecoverXATransactionResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.RecoverXATransactionResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.RecoverXATransactionResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.RecoverXATransactionResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("beginTransaction", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.BeginTransactionArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.BeginTransactionArgs{conn_id: conn_id, isolation_level: isolation_level, flags: flags, token: token}, ""} ->
          try() do
            rsp = handler_module.begin_transaction(conn_id, isolation_level, flags, token)
            (
              response = %Thrift.Generated.SnappyDataService.BeginTransactionResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.BeginTransactionResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.BeginTransactionResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.BeginTransactionResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("rollbackTransaction", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.RollbackTransactionArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.RollbackTransactionArgs{conn_id: conn_id, start_new_transaction: start_new_transaction, flags: flags, token: token}, ""} ->
          try() do
            rsp = handler_module.rollback_transaction(conn_id, start_new_transaction, flags, token)
            (
              _ = rsp
              :noreply
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.RollbackTransactionResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.RollbackTransactionResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("executePreparedUpdate", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.ExecutePreparedUpdateArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.ExecutePreparedUpdateArgs{stmt_id: stmt_id, params: params, attrs: attrs, token: token}, ""} ->
          try() do
            rsp = handler_module.execute_prepared_update(stmt_id, params, attrs, token)
            (
              response = %Thrift.Generated.SnappyDataService.ExecutePreparedUpdateResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.ExecutePreparedUpdateResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.ExecutePreparedUpdateResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.ExecutePreparedUpdateResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("fetchActiveStatements", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.FetchActiveStatementsArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.FetchActiveStatementsArgs{conn_id: conn_id, token: token}, ""} ->
          try() do
            rsp = handler_module.fetch_active_statements(conn_id, token)
            (
              response = %Thrift.Generated.SnappyDataService.FetchActiveStatementsResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.FetchActiveStatementsResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.FetchActiveStatementsResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.FetchActiveStatementsResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("openConnection", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.OpenConnectionArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.OpenConnectionArgs{arguments: arguments}, ""} ->
          try() do
            rsp = handler_module.open_connection(arguments)
            (
              response = %Thrift.Generated.SnappyDataService.OpenConnectionResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.OpenConnectionResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.OpenConnectionResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.OpenConnectionResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("getBlobChunk", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.GetBlobChunkArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.GetBlobChunkArgs{conn_id: conn_id, lob_id: lob_id, offset: offset, size: size, free_lob_at_end: free_lob_at_end, token: token}, ""} ->
          try() do
            rsp = handler_module.get_blob_chunk(conn_id, lob_id, offset, size, free_lob_at_end, token)
            (
              response = %Thrift.Generated.SnappyDataService.GetBlobChunkResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.GetBlobChunkResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.GetBlobChunkResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.GetBlobChunkResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("startXATransaction", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.StartXATransactionArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.StartXATransactionArgs{conn_id: conn_id, xid: xid, timeout_in_seconds: timeout_in_seconds, flags: flags, token: token}, ""} ->
          try() do
            rsp = handler_module.start_xa_transaction(conn_id, xid, timeout_in_seconds, flags, token)
            (
              _ = rsp
              :noreply
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.StartXATransactionResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.StartXATransactionResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("getUDTs", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.GetUDTsArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.GetUDTsArgs{metadata_args: metadata_args, types: types}, ""} ->
          try() do
            rsp = handler_module.get_ud_ts(metadata_args, types)
            (
              response = %Thrift.Generated.SnappyDataService.GetUDTsResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.GetUDTsResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.GetUDTsResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.GetUDTsResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("getServiceMetaData", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.GetServiceMetaDataArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.GetServiceMetaDataArgs{conn_id: conn_id, token: token}, ""} ->
          try() do
            rsp = handler_module.get_service_meta_data(conn_id, token)
            (
              response = %Thrift.Generated.SnappyDataService.GetServiceMetaDataResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.GetServiceMetaDataResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.GetServiceMetaDataResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.GetServiceMetaDataResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("prepareXATransaction", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.PrepareXATransactionArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.PrepareXATransactionArgs{conn_id: conn_id, xid: xid, token: token}, ""} ->
          try() do
            rsp = handler_module.prepare_xa_transaction(conn_id, xid, token)
            (
              response = %Thrift.Generated.SnappyDataService.PrepareXATransactionResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.PrepareXATransactionResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.PrepareXATransactionResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.PrepareXATransactionResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("executePreparedQuery", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.ExecutePreparedQueryArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.ExecutePreparedQueryArgs{stmt_id: stmt_id, params: params, attrs: attrs, token: token}, ""} ->
          try() do
            rsp = handler_module.execute_prepared_query(stmt_id, params, attrs, token)
            (
              response = %Thrift.Generated.SnappyDataService.ExecutePreparedQueryResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.ExecutePreparedQueryResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.ExecutePreparedQueryResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.ExecutePreparedQueryResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("getAllServersWithPreferredServer", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.GetAllServersWithPreferredServerArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.GetAllServersWithPreferredServerArgs{server_types: server_types, server_groups: server_groups, failed_servers: failed_servers}, ""} ->
          try() do
            rsp = handler_module.get_all_servers_with_preferred_server(server_types, server_groups, failed_servers)
            (
              response = %Thrift.Generated.SnappyDataService.GetAllServersWithPreferredServerResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.GetAllServersWithPreferredServerResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.GetAllServersWithPreferredServerResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.GetAllServersWithPreferredServerResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("sendBlobChunk", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.SendBlobChunkArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.SendBlobChunkArgs{chunk: chunk, conn_id: conn_id, token: token}, ""} ->
          try() do
            rsp = handler_module.send_blob_chunk(chunk, conn_id, token)
            (
              response = %Thrift.Generated.SnappyDataService.SendBlobChunkResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.SendBlobChunkResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.SendBlobChunkResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.SendBlobChunkResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("endXATransaction", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.EndXATransactionArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.EndXATransactionArgs{conn_id: conn_id, xid: xid, flags: flags, token: token}, ""} ->
          try() do
            rsp = handler_module.end_xa_transaction(conn_id, xid, flags, token)
            (
              _ = rsp
              :noreply
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.EndXATransactionResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.EndXATransactionResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("rollbackXATransaction", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.RollbackXATransactionArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.RollbackXATransactionArgs{conn_id: conn_id, xid: xid, token: token}, ""} ->
          try() do
            rsp = handler_module.rollback_xa_transaction(conn_id, xid, token)
            (
              _ = rsp
              :noreply
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.RollbackXATransactionResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.RollbackXATransactionResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("bulkClose", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.BulkCloseArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.BulkCloseArgs{entities: entities}, ""} ->
          try() do
            rsp = handler_module.bulk_close(entities)
            (
              _ = rsp
              :noreply
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            []
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("prepareStatement", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.PrepareStatementArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.PrepareStatementArgs{conn_id: conn_id, sql: sql, output_params: output_params, attrs: attrs, token: token}, ""} ->
          try() do
            rsp = handler_module.prepare_statement(conn_id, sql, output_params, attrs, token)
            (
              response = %Thrift.Generated.SnappyDataService.PrepareStatementResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.PrepareStatementResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.PrepareStatementResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.PrepareStatementResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("commitXATransaction", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.CommitXATransactionArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.CommitXATransactionArgs{conn_id: conn_id, xid: xid, one_phase: one_phase, token: token}, ""} ->
          try() do
            rsp = handler_module.commit_xa_transaction(conn_id, xid, one_phase, token)
            (
              _ = rsp
              :noreply
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.CommitXATransactionResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.CommitXATransactionResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("executeCursorUpdate", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.ExecuteCursorUpdateArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.ExecuteCursorUpdateArgs{cursor_id: cursor_id, operations: operations, changed_rows: changed_rows, changed_columns_list: changed_columns_list, changed_row_indexes: changed_row_indexes, token: token}, ""} ->
          try() do
            rsp = handler_module.execute_cursor_update(cursor_id, operations, changed_rows, changed_columns_list, changed_row_indexes, token)
            (
              _ = rsp
              :noreply
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.ExecuteCursorUpdateResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.ExecuteCursorUpdateResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("setTransactionAttributes", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.SetTransactionAttributesArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.SetTransactionAttributesArgs{conn_id: conn_id, flags: flags, token: token}, ""} ->
          try() do
            rsp = handler_module.set_transaction_attributes(conn_id, flags, token)
            (
              _ = rsp
              :noreply
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.SetTransactionAttributesResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.SetTransactionAttributesResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("executePreparedBatch", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.ExecutePreparedBatchArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.ExecutePreparedBatchArgs{stmt_id: stmt_id, params_batch: params_batch, attrs: attrs, token: token}, ""} ->
          try() do
            rsp = handler_module.execute_prepared_batch(stmt_id, params_batch, attrs, token)
            (
              response = %Thrift.Generated.SnappyDataService.ExecutePreparedBatchResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.ExecutePreparedBatchResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.ExecutePreparedBatchResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.ExecutePreparedBatchResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("freeLob", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.FreeLobArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.FreeLobArgs{conn_id: conn_id, lob_id: lob_id, token: token}, ""} ->
          try() do
            rsp = handler_module.free_lob(conn_id, lob_id, token)
            (
              _ = rsp
              :noreply
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.FreeLobResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.FreeLobResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("getNextResultSet", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.GetNextResultSetArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.GetNextResultSetArgs{cursor_id: cursor_id, other_result_set_behaviour: other_result_set_behaviour, token: token}, ""} ->
          try() do
            rsp = handler_module.get_next_result_set(cursor_id, other_result_set_behaviour, token)
            (
              response = %Thrift.Generated.SnappyDataService.GetNextResultSetResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.GetNextResultSetResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.GetNextResultSetResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.GetNextResultSetResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("fetchActiveConnections", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.FetchActiveConnectionsArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.FetchActiveConnectionsArgs{conn_id: conn_id, token: token}, ""} ->
          try() do
            rsp = handler_module.fetch_active_connections(conn_id, token)
            (
              response = %Thrift.Generated.SnappyDataService.FetchActiveConnectionsResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.FetchActiveConnectionsResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.FetchActiveConnectionsResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.FetchActiveConnectionsResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("closeConnection", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.CloseConnectionArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.CloseConnectionArgs{conn_id: conn_id, close_socket: close_socket, token: token}, ""} ->
          try() do
            rsp = handler_module.close_connection(conn_id, close_socket, token)
            (
              _ = rsp
              :noreply
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            []
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("execute", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.ExecuteArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.ExecuteArgs{conn_id: conn_id, sql: sql, output_params: output_params, attrs: attrs, token: token}, ""} ->
          try() do
            rsp = handler_module.execute(conn_id, sql, output_params, attrs, token)
            (
              response = %Thrift.Generated.SnappyDataService.ExecuteResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.ExecuteResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.ExecuteResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.ExecuteResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("executeQuery", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.ExecuteQueryArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.ExecuteQueryArgs{conn_id: conn_id, sql: sql, attrs: attrs, token: token}, ""} ->
          try() do
            rsp = handler_module.execute_query(conn_id, sql, attrs, token)
            (
              response = %Thrift.Generated.SnappyDataService.ExecuteQueryResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.ExecuteQueryResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.ExecuteQueryResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.ExecuteQueryResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("getTransactionAttributes", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.GetTransactionAttributesArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.GetTransactionAttributesArgs{conn_id: conn_id, token: token}, ""} ->
          try() do
            rsp = handler_module.get_transaction_attributes(conn_id, token)
            (
              response = %Thrift.Generated.SnappyDataService.GetTransactionAttributesResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.GetTransactionAttributesResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.GetTransactionAttributesResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.GetTransactionAttributesResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("sendClobChunk", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.SendClobChunkArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.SendClobChunkArgs{chunk: chunk, conn_id: conn_id, token: token}, ""} ->
          try() do
            rsp = handler_module.send_clob_chunk(chunk, conn_id, token)
            (
              response = %Thrift.Generated.SnappyDataService.SendClobChunkResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.SendClobChunkResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.SendClobChunkResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.SendClobChunkResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("closeResultSet", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.CloseResultSetArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.CloseResultSetArgs{cursor_id: cursor_id, token: token}, ""} ->
          try() do
            rsp = handler_module.close_result_set(cursor_id, token)
            (
              _ = rsp
              :noreply
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.CloseResultSetResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.CloseResultSetResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("executePrepared", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.ExecutePreparedArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.ExecutePreparedArgs{stmt_id: stmt_id, params: params, output_params: output_params, attrs: attrs, token: token}, ""} ->
          try() do
            rsp = handler_module.execute_prepared(stmt_id, params, output_params, attrs, token)
            (
              response = %Thrift.Generated.SnappyDataService.ExecutePreparedResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.ExecutePreparedResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.ExecutePreparedResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.ExecutePreparedResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("closeStatement", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.CloseStatementArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.CloseStatementArgs{stmt_id: stmt_id, token: token}, ""} ->
          try() do
            rsp = handler_module.close_statement(stmt_id, token)
            (
              _ = rsp
              :noreply
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.CloseStatementResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.CloseStatementResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("commitTransaction", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.CommitTransactionArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.CommitTransactionArgs{conn_id: conn_id, start_new_transaction: start_new_transaction, flags: flags, token: token}, ""} ->
          try() do
            rsp = handler_module.commit_transaction(conn_id, start_new_transaction, flags, token)
            (
              _ = rsp
              :noreply
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.CommitTransactionResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.CommitTransactionResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("prepareAndExecute", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.PrepareAndExecuteArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.PrepareAndExecuteArgs{conn_id: conn_id, sql: sql, params_batch: params_batch, output_params: output_params, attrs: attrs, token: token}, ""} ->
          try() do
            rsp = handler_module.prepare_and_execute(conn_id, sql, params_batch, output_params, attrs, token)
            (
              response = %Thrift.Generated.SnappyDataService.PrepareAndExecuteResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.PrepareAndExecuteResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.PrepareAndExecuteResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.PrepareAndExecuteResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("forgetXATransaction", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.ForgetXATransactionArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.ForgetXATransactionArgs{conn_id: conn_id, xid: xid, token: token}, ""} ->
          try() do
            rsp = handler_module.forget_xa_transaction(conn_id, xid, token)
            (
              _ = rsp
              :noreply
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.ForgetXATransactionResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.ForgetXATransactionResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("getIndexInfo", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.GetIndexInfoArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.GetIndexInfoArgs{metadata_args: metadata_args, unique: unique, approximate: approximate}, ""} ->
          try() do
            rsp = handler_module.get_index_info(metadata_args, unique, approximate)
            (
              response = %Thrift.Generated.SnappyDataService.GetIndexInfoResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.GetIndexInfoResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.GetIndexInfoResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.GetIndexInfoResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("scrollCursor", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.ScrollCursorArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.ScrollCursorArgs{cursor_id: cursor_id, offset: offset, offset_is_absolute: offset_is_absolute, fetch_reverse: fetch_reverse, fetch_size: fetch_size, token: token}, ""} ->
          try() do
            rsp = handler_module.scroll_cursor(cursor_id, offset, offset_is_absolute, fetch_reverse, fetch_size, token)
            (
              response = %Thrift.Generated.SnappyDataService.ScrollCursorResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.ScrollCursorResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.ScrollCursorResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.ScrollCursorResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("executeUpdate", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.ExecuteUpdateArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.ExecuteUpdateArgs{conn_id: conn_id, sqls: sqls, attrs: attrs, token: token}, ""} ->
          try() do
            rsp = handler_module.execute_update(conn_id, sqls, attrs, token)
            (
              response = %Thrift.Generated.SnappyDataService.ExecuteUpdateResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.ExecuteUpdateResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.ExecuteUpdateResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.ExecuteUpdateResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("getBestRowIdentifier", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.GetBestRowIdentifierArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.GetBestRowIdentifierArgs{metadata_args: metadata_args, scope: scope, nullable: nullable}, ""} ->
          try() do
            rsp = handler_module.get_best_row_identifier(metadata_args, scope, nullable)
            (
              response = %Thrift.Generated.SnappyDataService.GetBestRowIdentifierResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.GetBestRowIdentifierResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.GetBestRowIdentifierResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.GetBestRowIdentifierResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("cancelCurrentStatement", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.CancelCurrentStatementArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.CancelCurrentStatementArgs{conn_id: conn_id, token: token}, ""} ->
          try() do
            rsp = handler_module.cancel_current_statement(conn_id, token)
            (
              _ = rsp
              :noreply
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.CancelCurrentStatementResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.CancelCurrentStatementResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("getSchemaMetaData", binary_data, handler_module)) do
      case(Elixir.Thrift.Generated.SnappyDataService.GetSchemaMetaDataArgs.BinaryProtocol.deserialize(binary_data)) do
        {%Thrift.Generated.SnappyDataService.GetSchemaMetaDataArgs{schema_call: schema_call, metadata_args: metadata_args}, ""} ->
          try() do
            rsp = handler_module.get_schema_meta_data(schema_call, metadata_args)
            (
              response = %Thrift.Generated.SnappyDataService.GetSchemaMetaDataResponse{success: rsp}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.GetSchemaMetaDataResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in Thrift.Generated.SnappyException ->
              response = %Thrift.Generated.SnappyDataService.GetSchemaMetaDataResponse{error: error}
              {:reply, Elixir.Thrift.Generated.SnappyDataService.GetSchemaMetaDataResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
  end
end