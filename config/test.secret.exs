use Mix.Config

config :gatherto, Gatherto.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "phoenix",
  password: "phoenix",
  database: "gatherto_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
