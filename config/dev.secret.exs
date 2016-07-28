use Mix.Config

config :gatherto, Gatherto.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "phoenix",
  password: "phoenix",
  database: "gatherto_dev",
  hostname: "localhost",
  pool_size: 10
