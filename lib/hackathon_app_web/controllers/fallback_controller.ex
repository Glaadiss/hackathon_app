defmodule HackathonAppWeb.FallbackController do
  import Plug.Conn
  use HackathonAppWeb, :controller

  def auth_error(conn, {type, reason}, _opts) do
    body = Poison.encode!(%{message: to_string(type)})
    send_resp(conn, 401, body)
  end
  
  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(HackathonAppWeb.ChangesetView, "error.json", changeset: changeset)
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> render(HackathonAppWeb.ErrorView, :"404")
  end
end
