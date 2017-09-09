defmodule HackathonAppWeb.AwardView do
  use HackathonAppWeb, :view
  alias HackathonAppWeb.AwardView

  def render("index.json", %{awards: awards}) do
    %{data: render_many(awards, AwardView, "award.json")}
  end

  def render("show.json", %{award: award}) do
    %{data: render_one(award, AwardView, "award.json")}
  end

  def render("award.json", %{award: award}) do
    %{id: award.id,
      title: award.title,
      view_count: award.view_count,
      body: award.body,
      status: award.status}
  end
end
