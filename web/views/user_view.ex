defmodule Bro.UserView do
  use Bro.Web, :view

  def render("users.json", %{user: user}) do
    %{
      username: user.username
    }
  end
end
