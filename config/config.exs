# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :gatherto,
  ecto_repos: [Gatherto.Repo]

# Configures the endpoint
config :gatherto, Gatherto.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "U1T/brFnIk7MW5y25pbnzLOXI1LXTQANO0qv8fur+VuMWkYovEiFairmXKCz2Pbs",
  render_errors: [view: Gatherto.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Gatherto.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine

config :ueberauth, Ueberauth,
  providers: [
    strava: { Ueberauth.Strategy.Strava, [] },
    google: { Ueberauth.Strategy.Google, [] }
  ]

config :ueberauth, Ueberauth.Strategy.Strava.OAuth,
  client_id: System.get_env("STRAVA_CLIENT_ID"),
  client_secret: System.get_env("STRAVA_CLIENT_SECRET")

config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: System.get_env("GOOGLE_CLIENT_ID"),
  client_secret: System.get_env("GOOGLE_CLIENT_SECRET")

#TODO replace the secret key below - it was yanked from the above endpoint!
config :guardian, Guardian,
  issuer: "Gatherto",
  ttl: { 30, :days },
  secret_key: "U1T/brFnIk7MW5y25pbnzLOXI1LXTQANO0qv8fur+VuMWkYovEiFairmXKCz2Pbs",
  serializer: Gatherto.GuardianSerializer

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
