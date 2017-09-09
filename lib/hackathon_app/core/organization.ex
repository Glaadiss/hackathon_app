defmodule HackathonApp.Core.Organization do
  use Ecto.Schema
  import Ecto.Changeset
  alias HackathonApp.Core.Organization


  schema "organizations" do
    field :name, :string
    field :nip, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(%Organization{} = organization, attrs) do
    organization
    |> cast(attrs, [:name, :type, :nip])
    |> validate_required([:name, :nip])
  end
end
