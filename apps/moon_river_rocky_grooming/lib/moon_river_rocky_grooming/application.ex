defmodule MoonRiverRockyGrooming.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      MoonRiverRockyGrooming.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: MoonRiverRockyGrooming.PubSub}
      # Start a worker by calling: MoonRiverRockyGrooming.Worker.start_link(arg)
      # {MoonRiverRockyGrooming.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: MoonRiverRockyGrooming.Supervisor)
  end
end
