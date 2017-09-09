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
      subject: award.subject,
      topic: award.topic,
      city: award.city,
      authorFirstName: award.authorFirstName,
      authorLastName: award.authorLastName,
      province: award.province,
      value_to: award.value_to,
      value_from: award.value_from,
      state: award.state,
      user_id: award.user_id,
      avatar: award.avatar,
      view_count: award.view_count,
      body: award.body,
      }
  end
end