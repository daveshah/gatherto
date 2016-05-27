use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rnnr, Rnnr.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :rnnr, Rnnr.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "dshah",
  password: "",
  database: "local_corral_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
