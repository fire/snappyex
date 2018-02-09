defmodule Snappyex.Result do
  @type t :: %__MODULE__{
          command: atom,
          columns: [String.t()] | nil,
          rows: [[term] | binary] | nil,
          num_rows: integer,
          connection_id: pos_integer
        }

  defstruct command: nil, columns: nil, rows: nil, num_rows: nil, connection_id: nil
end
