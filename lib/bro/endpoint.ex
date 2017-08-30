defmodule Bro.Endpoint do
  use Phoenix.Endpoint, otp_app: :bro

  socket "/socket", Bro.UserSocket

  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_bro_key",
    signing_salt: "zvBGcMB6"

  plug CORSPlug

  plug Bro.Router
end
