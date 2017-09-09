defmodule HackathonAppWeb.Router do
  use HackathonAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :ensure_authed_access do
    # plug HackathonApp.AuthAccessPipeline
  end
  
  scope "/api", HackathonAppWeb do
    pipe_through :api
    post "/login", LoginController, :create
    delete "/login", LoginController, :delete
    resources "/users", UserController, only: [:create]    
  end

  scope "/api", HackathonAppWeb do
    pipe_through [:api, :ensure_authed_access]
    resources "/users", UserController, except: [:new, :edit, :create]    
    resources "/organizations", OrganizationController, except: [:new, :edit]
    resources "/awards", AwardController, except: [:new, :edit] do
      resources "/comments", CommentController, only: [:create, :index]      
    end
    resources "/comments", CommentController, only: [:update, :delete, :show]
  end
end
