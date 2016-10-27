# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :metascope,
  ecto_repos: [Metascope.Repo]

# Configures the endpoint
config :metascope, Metascope.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DgFXEMHi/F9jrCBAH+XgSrw6Ga2YsRsYmx0s3jeXK1LbBIAIO90VCkWqCskmd8h0",
  render_errors: [view: Metascope.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Metascope.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine

config :metascope,
  github_token: System.get_env("GITHUB_TOKEN")
