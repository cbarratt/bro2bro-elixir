defmodule Bro.Router do
  use Bro.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Bro do
    pipe_through :api
  end
end
