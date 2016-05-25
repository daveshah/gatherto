use Mix.Config

import_config "test.exs"

# Configure your database
config :local_corral, LocalCorral.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "",
  database: "local_corral_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
