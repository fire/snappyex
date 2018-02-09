defmodule Thrift.Generated.LocatorService.Handler do
  @callback get_all_servers_with_preferred_server(
              server_types :: %MapSet{},
              server_groups :: %MapSet{},
              failed_servers :: %MapSet{}
            ) :: [%Thrift.Generated.HostAddress{}]
  @callback get_preferred_server(
              server_types :: %MapSet{},
              server_groups :: %MapSet{},
              failed_servers :: %MapSet{}
            ) :: %Thrift.Generated.HostAddress{}
end
