use Mix.Config

config :logger, :console, format: "[$level] $message\n"
config :phoenix, :stacktrace_depth, 20

config :bro, Bro.Endpoint,
  http: [port: 4000],
  debug_errors: false,
  code_reloader: true,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin"]]

config :bro, Bro.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "bro2bro_dev",
  hostname: "localhost",
  pool_size: 10
