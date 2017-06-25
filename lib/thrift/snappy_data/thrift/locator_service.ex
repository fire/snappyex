defmodule(SnappyData.Thrift.LocatorService) do
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
        case(Elixir.SnappyData.Thrift.HostAddress.BinaryProtocol.deserialize(rest)) do
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
              SnappyData.Thrift.HostAddress.serialize(e)
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
        case(Elixir.SnappyData.Thrift.HostAddress.BinaryProtocol.deserialize(rest)) do
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
              SnappyData.Thrift.HostAddress.serialize(e)
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
        case(Elixir.SnappyData.Thrift.SnappyException.BinaryProtocol.deserialize(rest)) do
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
        case(Elixir.SnappyData.Thrift.HostAddress.BinaryProtocol.deserialize(rest)) do
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
              SnappyData.Thrift.HostAddress.serialize(e)
            end]
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | SnappyData.Thrift.SnappyException.serialize(error)]
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
        case(Elixir.SnappyData.Thrift.HostAddress.BinaryProtocol.deserialize(rest)) do
          {value, rest} ->
            deserialize(rest, %{acc | success: value})
          :error ->
            :error
        end
      end
      defp(deserialize(<<12, 1::16-signed, rest::binary>>, acc)) do
        case(Elixir.SnappyData.Thrift.SnappyException.BinaryProtocol.deserialize(rest)) do
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
            [<<12, 0::16-signed>> | SnappyData.Thrift.HostAddress.serialize(success)]
        end, case(error) do
          nil ->
            <<>>
          _ ->
            [<<12, 1::16-signed>> | SnappyData.Thrift.SnappyException.serialize(error)]
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
    def(start_link(host, port, opts \\ [])) do
      ClientImpl.start_link(host, port, opts)
    end
    def(get_all_servers_with_preferred_server_with_options(client, server_types, server_groups, failed_servers, opts)) do
      args = %SnappyData.Thrift.LocatorService.GetAllServersWithPreferredServerArgs{server_types: server_types, server_groups: server_groups, failed_servers: failed_servers}
      serialized_args = Elixir.SnappyData.Thrift.LocatorService.GetAllServersWithPreferredServerArgs.BinaryProtocol.serialize(args)
      case(ClientImpl.call(client, "getAllServersWithPreferredServer", serialized_args, opts)) do
        {:ok, serialized_response} ->
          case(GetAllServersWithPreferredServerResponse.BinaryProtocol.deserialize(serialized_response)) do
            {%{success: nil} = resp, ""} ->
              responses = resp |> Map.from_struct() |> Map.values() |> Enum.reject(&(is_nil(&1)))
              case(responses) do
                [exception] ->
                  {:error, {:exception, exception}}
                [] ->
                  {:ok, nil}
              end
            {%{success: success}, ""} ->
              {:ok, success}
          end
        {:error, _} = err ->
          err
      end
    end
    def(get_all_servers_with_preferred_server(client, server_types, server_groups, failed_servers)) do
      get_all_servers_with_preferred_server_with_options(client, server_types, server_groups, failed_servers, [])
    end
    def(get_all_servers_with_preferred_server_with_options!(client, server_types, server_groups, failed_servers, opts)) do
      case(get_all_servers_with_preferred_server_with_options(client, server_types, server_groups, failed_servers, opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(get_all_servers_with_preferred_server!(client, server_types, server_groups, failed_servers)) do
      get_all_servers_with_preferred_server_with_options!(client, server_types, server_groups, failed_servers, [])
    end
    def(get_preferred_server_with_options(client, server_types, server_groups, failed_servers, opts)) do
      args = %SnappyData.Thrift.LocatorService.GetPreferredServerArgs{server_types: server_types, server_groups: server_groups, failed_servers: failed_servers}
      serialized_args = Elixir.SnappyData.Thrift.LocatorService.GetPreferredServerArgs.BinaryProtocol.serialize(args)
      case(ClientImpl.call(client, "getPreferredServer", serialized_args, opts)) do
        {:ok, serialized_response} ->
          case(GetPreferredServerResponse.BinaryProtocol.deserialize(serialized_response)) do
            {%{success: nil} = resp, ""} ->
              responses = resp |> Map.from_struct() |> Map.values() |> Enum.reject(&(is_nil(&1)))
              case(responses) do
                [exception] ->
                  {:error, {:exception, exception}}
                [] ->
                  {:ok, nil}
              end
            {%{success: success}, ""} ->
              {:ok, success}
          end
        {:error, _} = err ->
          err
      end
    end
    def(get_preferred_server(client, server_types, server_groups, failed_servers)) do
      get_preferred_server_with_options(client, server_types, server_groups, failed_servers, [])
    end
    def(get_preferred_server_with_options!(client, server_types, server_groups, failed_servers, opts)) do
      case(get_preferred_server_with_options(client, server_types, server_groups, failed_servers, opts)) do
        {:ok, rsp} ->
          rsp
        {:error, {:exception, ex}} ->
          raise(ex)
        {:error, _} = err ->
          raise(err)
      end
    end
    def(get_preferred_server!(client, server_types, server_groups, failed_servers)) do
      get_preferred_server_with_options!(client, server_types, server_groups, failed_servers, [])
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
    def(handle_thrift("getAllServersWithPreferredServer", binary_data, handler_module)) do
      case(Elixir.SnappyData.Thrift.LocatorService.GetAllServersWithPreferredServerArgs.BinaryProtocol.deserialize(binary_data)) do
        {%SnappyData.Thrift.LocatorService.GetAllServersWithPreferredServerArgs{server_types: server_types, server_groups: server_groups, failed_servers: failed_servers}, ""} ->
          try() do
            rsp = handler_module.get_all_servers_with_preferred_server(server_types, server_groups, failed_servers)
            (
              response = %SnappyData.Thrift.LocatorService.GetAllServersWithPreferredServerResponse{success: rsp}
              {:reply, Elixir.SnappyData.Thrift.LocatorService.GetAllServersWithPreferredServerResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in SnappyData.Thrift.SnappyException ->
              response = %SnappyData.Thrift.LocatorService.GetAllServersWithPreferredServerResponse{error: error}
              {:reply, Elixir.SnappyData.Thrift.LocatorService.GetAllServersWithPreferredServerResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
    def(handle_thrift("getPreferredServer", binary_data, handler_module)) do
      case(Elixir.SnappyData.Thrift.LocatorService.GetPreferredServerArgs.BinaryProtocol.deserialize(binary_data)) do
        {%SnappyData.Thrift.LocatorService.GetPreferredServerArgs{server_types: server_types, server_groups: server_groups, failed_servers: failed_servers}, ""} ->
          try() do
            rsp = handler_module.get_preferred_server(server_types, server_groups, failed_servers)
            (
              response = %SnappyData.Thrift.LocatorService.GetPreferredServerResponse{success: rsp}
              {:reply, Elixir.SnappyData.Thrift.LocatorService.GetPreferredServerResponse.BinaryProtocol.serialize(response)}
            )
          catch
            kind, reason ->
              formatted_exception = Exception.format(kind, reason, System.stacktrace())
              Logger.error("Exception not defined in thrift spec was thrown: #{formatted_exception}")
              error = Thrift.TApplicationException.exception(type: :internal_error, message: "Server error: #{formatted_exception}")
              {:server_error, error}
          rescue
            error in SnappyData.Thrift.SnappyException ->
              response = %SnappyData.Thrift.LocatorService.GetPreferredServerResponse{error: error}
              {:reply, Elixir.SnappyData.Thrift.LocatorService.GetPreferredServerResponse.BinaryProtocol.serialize(response)}
          end
        {_, extra} ->
          raise(Thrift.TApplicationException, type: :protocol_error, message: "Could not decode #{inspect(extra)}")
      end
    end
  end
end