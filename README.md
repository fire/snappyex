# SnappyData Adapter

Work in Progress Adapter. 

## Example

```elixir
{:ok, pid} = Snappyex.start_link([clientHostName: "127.0.0.1", host: "192.168.1.80", clientID: "ElixirClient1|0x" <> Base.encode16(inspect self), 
     port: 1531, userName: "APP", password: "APP",  security: Snappyex.Model.SecurityMechanism.plain, 
     tokenSize: 16, useStringForDecimal: false, properties: :dict.new])
Snappyex.prepare_execute(pid, "SELECT 1", [])
```
