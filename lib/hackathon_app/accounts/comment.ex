defmodule HackathonApp.Accounts.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias HackathonApp.Accounts.Comment


  schema "comments" do
    field :author, :string
    field :title, :string
    field :user_id, :id
    field :award_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Comment{} = comment, attrs) do
    comment
    |> cast(attrs, [:title, :author])
    |> validate_required([:title, :author, :user_id, :award_id])
  end
end
