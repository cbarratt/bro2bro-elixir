defmodule Bro.BrosView do
  use Bro.Web, :view

  def render("index.json", %{bros: bros}) do
    %{bros: bros}
  end
end
