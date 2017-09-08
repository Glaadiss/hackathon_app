defmodule HackathonAppWeb.UserView do
  use HackathonAppWeb, :view
  alias HackathonAppWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      lastname: user.lastname,
      email: user.email,
      type: user.type,
      password: user.password,
      status: user.status}
  end
end
