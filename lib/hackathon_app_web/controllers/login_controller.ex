defmodule HackathonAppWeb.LoginController do
  use HackathonAppWeb, :controller
  
  alias HackathonApp.Repo
  alias HackathonApp.Accounts
  alias HackathonApp.Accounts.User

  action_fallback HackathonAppWeb.FallbackController
 
  def create(conn, params) do
    %{"login"=> login, "password"=> password} = params
    user = Repo.get_by(User, email: login, password: password)
    if user do 
      {:ok, jwt, claims} = HackathonApp.Guardian.encode_and_sign(user)
      conn  
      |> put_resp_header("authorization", "Bearer #{jwt}")
      |> put_resp_header("content-type", "application/json;")
      |> put_resp_header("access-control-allow-headers", "access-control-allow-origin")
      |> json %{user: user, token: jwt}
    else
      json(conn, %{error: "Bad login or password"})
    end
  end
  
  def delete(conn, _params) do
    jwt = Guardian.Plug.current_token(conn)
    Guardian.revoke!(jwt)
    render(conn)
  end

end