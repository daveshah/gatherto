use Mix.Config

import_config "test.exs"

# Configure your database
config :gatherto, Gatherto.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "",
  database: "gatherto_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
