# SnappyData Adapter

Work in Progress Adapter. 

## Example

```elixir
require SnappyData.Thrift.SecurityMechanism
{:ok, pid} = Snappyex.start_link([backoff_type: :stop, sync_connect: true, hostname: "192.168.0.23", client_id: "ElixirClient1|0x" <> Base.encode16(inspect self()), port: 31292, username: "APP", password: "APP",  security: SnappyData.Thrift.SecurityMechanism.plain, token_size: 16, use_string_for_decimal: false, properties: %{"load-balance" => "false"}])
Snappyex.prepare_execute(pid, "SELECT from sys.member", "select id, kind, status, host, port from sys.members", [])
Snappyex.prepare_execute(pid, "SELECT", ~s[SELECT w0."id", w0."randomnumber" FROM "world" AS w0 WHERE (w0."id" = ?)], [1])
```
