defmodule Bro.BrosController do
  use Bro.Web, :controller

  plug Guardian.Plug.EnsureAuthenticated, handler: Bro.SessionController

  alias Bro.User

  def index(conn, _) do
    bros = Bro.Repo.all(User)

    conn
    |> put_status(:ok)
    |> render("index.json", bros: bros)
  end
end
