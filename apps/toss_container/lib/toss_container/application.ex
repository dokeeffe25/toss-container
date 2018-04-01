defmodule TossContainer.Application do
  @moduledoc false

  use Application

  def start(_type, args) do
    children = [
      {TossContainer.Watcher, args}
    ]

    opts = [strategy: :one_for_one, name: TossContainer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
