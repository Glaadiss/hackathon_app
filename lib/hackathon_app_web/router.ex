defmodule HackathonAppWeb.Router do
  use HackathonAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :ensure_authed_access do
    plug HackathonApp.AuthAccessPipeline
  end
  
  scope "/api", HackathonAppWeb do
    pipe_through :api
    post "/login", LoginController, :create
    delete "/login", LoginController, :delete
  end

  scope "/api", HackathonAppWeb do
    pipe_through [:api, :ensure_authed_access]
    resources "/users", UserController, except: [:new, :edit]    
    resources "/organizations", OrganizationController, except: [:new, :edit]
    
  end
end
