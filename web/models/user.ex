defmodule Bro.User do
  use Bro.Web, :model

  schema "users" do
    field :username, :string

    timestamps
  end

  @required_fields ~w(username)
  @optional_fields ~w()

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
