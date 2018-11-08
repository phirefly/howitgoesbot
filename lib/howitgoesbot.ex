defmodule Howitgoesbot do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      Plug.Adapters.Cowboy.child_spec(scheme: :http, plug: Howitgoesbot.Router, options: [port: 4001]),
      supervisor(Howitgoesbot.Repo, [])
    ]

    opts = [strategy: :one_for_one, name: Howitgoesbot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
