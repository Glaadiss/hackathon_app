defmodule HackathonApp.Core.Award do
  use Ecto.Schema
  import Ecto.Changeset
  alias HackathonApp.Core.Award


  schema "awards" do
    field :body, :string
    field :status, :integer
    field :title, :string
    field :view_count, :integer
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Award{} = award, attrs) do
    award
    |> cast(attrs, [:title, :view_count, :body, :status])
    |> validate_required([:title, :view_count, :body, :status])
  end
end
