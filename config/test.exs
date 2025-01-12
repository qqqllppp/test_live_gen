import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :test_live_gen, TestLiveGenWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "VWMBYw1hK+5sjxFSRkvrZGemlc42iXp8lyzeffczARBJwVOtaQdOwEV+pK8CeL6j",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :phoenix_live_view,
  # Enable helpful, but potentially expensive runtime checks
  enable_expensive_runtime_checks: true
