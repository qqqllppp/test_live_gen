defmodule TestLiveGen.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TestLiveGenWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:test_live_gen, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: TestLiveGen.PubSub},
      # Start a worker by calling: TestLiveGen.Worker.start_link(arg)
      # {TestLiveGen.Worker, arg},
      # Start to serve requests, typically the last entry
      TestLiveGenWeb.Endpoint,
      {TestLiveGen.Test, [%{use_state: "abc", id: :a}, %{use_state: "def", id: :b}]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TestLiveGen.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TestLiveGenWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
