# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :bro,
  ecto_repos: [Bro.Repo]

# Configures the endpoint
config :bro, Bro.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "eUrBaw3PradoUy/xicQsspUKdHQtgf46uieDd9KZt4tXTEfk9cItSLEp1HBkqWUz",
  render_errors: [view: Bro.ErrorView, accepts: ~w(json)],
  pubsub: [name: Bro.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
