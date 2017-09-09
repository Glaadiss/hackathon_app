defmodule HackathonAppWeb.CommentController do
  use HackathonAppWeb, :controller
  alias HackathonApp.Repo
  alias HackathonApp.Accounts
  alias HackathonApp.Accounts.Comment
  import Ecto.Query, only: [from: 2]
  
  action_fallback HackathonAppWeb.FallbackController

  def index(conn, %{"award_id"=> award_id}) do
    comments = Repo.all(from u in Comment, where: u.award_id == ^award_id)
    render(conn, "index.json", comments: comments)
  end

  def create(conn, %{"comment" => comment_params, "award_id" => award_id})  do
    comments_params = Map.put(comment_params, "award_id", award_id)
    with {:ok, %Comment{} = comment} <- Accounts.create_comment(comment_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", comment_path(conn, :show, comment))
      |> render("show.json", comment: comment)
    end
  end

  def show(conn, %{"id" => id}) do
    comment = Accounts.get_comment!(id)
    render(conn, "show.json", comment: comment)
  end

  def update(conn, %{"id" => id, "comment" => comment_params}) do
    comment = Accounts.get_comment!(id)

    with {:ok, %Comment{} = comment} <- Accounts.update_comment(comment, comment_params) do
      render(conn, "show.json", comment: comment)
    end
  end

  def delete(conn, %{"id" => id}) do
    comment = Accounts.get_comment!(id)
    with {:ok, %Comment{}} <- Accounts.delete_comment(comment) do
      send_resp(conn, :no_content, "")
    end
  end
end
