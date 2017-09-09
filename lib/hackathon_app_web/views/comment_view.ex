defmodule HackathonAppWeb.CommentView do
  use HackathonAppWeb, :view
  alias HackathonAppWeb.CommentView

  def render("index.json", %{comments: comments}) do
    %{data: render_many(comments, CommentView, "comment.json")}
  end

  def render("show.json", %{comment: comment}) do
    %{data: render_one(comment, CommentView, "comment.json")}
  end

  def render("comment.json", %{comment: comment}) do
    %{id: comment.id,
      title: comment.title,
      author: comment.author}
  end
end
