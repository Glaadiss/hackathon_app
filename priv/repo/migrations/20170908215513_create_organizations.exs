defmodule HackathonApp.Repo.Migrations.CreateOrganizations do
  use Ecto.Migration

  def change do
    create table(:organizations) do
      add :name, :string
      add :type, :string
      add :nip, :string

      timestamps()
    end

  end
end
