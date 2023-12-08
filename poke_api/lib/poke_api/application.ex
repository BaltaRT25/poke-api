defmodule PokeApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PokeApiWeb.Telemetry,
      PokeApi.Repo,
      # {DNSCluster, query: Application.get_env(:poke_api, :dns_cluster_query) || :ignore},
      # publisher subscriber --> PubSub
      {Phoenix.PubSub, name: PokeApi.PubSub},
      # Start a worker by calling: PokeApi.Worker.start_link(arg)
      # {PokeApi.Worker, arg},
      # Start to serve requests, typically the last entry
      PokeApiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PokeApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PokeApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
