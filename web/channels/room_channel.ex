defmodule Bro.RoomChannel do
  use Bro.Web, :channel

  alias Bro.{User, UserView}

  # Currently just returns a list of all bro's
  def join("rooms:lobby", _message, socket) do
    users = Repo.all(User)

    response = %{users: Phoenix.View.render_many(users, UserView, "users.json")}

    IO.inspect response

    {:ok, response, socket}
  end

  # We may need this for when the user has entered their username
  # to subscribe them to 'bro' messages
  # def join("rooms:" <> username, _message, _socket) do
    # user = Repo.all()

    # response = %{users: Phoenix.View.render_many(users, UserView, "users.json")}

    # IO.inspect response

    # {:ok, response, socket}
  # end

  def handle_in("new_msg", params, socket) do
    changeset = User.changeset(%User{}, params)

    case Repo.insert(changeset) do
      {:ok, user} -> broadcast! socket, "new_msg", %{user: user.username}
    end

    {:noreply, socket}
  end
end
