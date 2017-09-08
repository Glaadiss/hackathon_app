defmodule HackathonAppWeb.Router do
  use HackathonAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HackathonAppWeb do
    pipe_through :api
  end
end
