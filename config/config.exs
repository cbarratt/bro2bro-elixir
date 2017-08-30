use Mix.Config

config :bro, ecto_repos: [Bro.Repo]
config :comeonin, :bcrypt_log_rounds, 4

config :bro, Bro.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "eUrBaw3PradoUy/xicQsspUKdHQtgf46uieDd9KZt4tXTEfk9cItSLEp1HBkqWUz",
  render_errors: [view: Bro.ErrorView, accepts: ~w(json)],
  pubsub: [
    name: Bro.PubSub,
    adapter: Phoenix.PubSub.PG2
  ]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  allowed_algos: ["HS512"],
  verify_module: Guardian.JWT,
  issuer: "Bro2Bro",
  ttl: { 30, :days },
  verify_issuer: true,
  serializer: Bro.GuardianSerializer,
  secret_key: %{
    "k" => "_AbBL082GKlPjoY9o-KM78PhyALavJRtZXOW7D-ZyqE",
    "kty" => "oct"
  }

import_config "#{Mix.env}.exs"
