defmodule HackathonAppWeb.AwardController do
  use HackathonAppWeb, :controller
  alias HackathonApp.Repo
  alias HackathonApp.Core
  alias HackathonApp.Core.Award
  import Ecto.Query, only: [from: 2]
  
  action_fallback HackathonAppWeb.FallbackController

  def index(conn, params) do
    awards = cond do
      params["user_id"] -> Repo.all(from u in Award, where: u.user_id == ^params["user_id"])
      params["subject"] -> Repo.all(from u in Award, where: u.subject == ^params["subject"] )
      params["topic"] -> Repo.all(from u in Award, where: ilike(u.topic, ^"%#{params["topic"]}%"))
      true -> Core.list_awards() 
    end
    render(conn, "index.json", awards: awards)
  end

  def create(conn, %{"award" => award_params}) do
    with {:ok, %Award{} = award} <- Core.create_award(award_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", award_path(conn, :show, award))
      |> render("show.json", award: award)
    end
  end

  def show(conn, %{"id" => id}) do
    award = Core.get_award!(id)
    render(conn, "show.json", award: award)
  end

  def update(conn, %{"id" => id, "award" => award_params}) do
    award = Core.get_award!(id)

    with {:ok, %Award{} = award} <- Core.update_award(award, award_params) do
      render(conn, "show.json", award: award)
    end
  end

  def delete(conn, %{"id" => id}) do
    award = Core.get_award!(id)
    with {:ok, %Award{}} <- Core.delete_award(award) do
      send_resp(conn, :no_content, "")
    end
  end
end
