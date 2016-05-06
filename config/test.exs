use Mix.Config

config :logger, level: :warn

config :bro, Bro.Endpoint,
  http: [port: 4001],
  server: false

config :bro, Bro.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "bro2bro_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
