defmodule TossContainerServer.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    # TODO config file
    children = [
      Plug.Adapters.Cowboy.child_spec(scheme: :http, plug: TossContainerServer.Router, options: [port: 4000])
    ]

    opts = [strategy: :one_for_one, name: TossContainerServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
