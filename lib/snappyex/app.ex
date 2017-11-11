defmodule Snappyex.App do
  @moduledoc false
  use Application

  def start(_, _) do
    import Supervisor.Spec, warn: false
    opts = [strategy: :one_for_one, name: Snappyex.Supervisor]
    children = []
    Supervisor.start_link(children, opts)
  end
end
