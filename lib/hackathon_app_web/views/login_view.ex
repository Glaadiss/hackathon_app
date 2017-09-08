defmodule HackathonAppWeb.LoginView do
  use HackathonAppWeb, :view
  alias HackathonAppWeb.LoginView

  def render("login.json", %{user: user}) do
    user
  end
end
