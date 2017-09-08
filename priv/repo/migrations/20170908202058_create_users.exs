defmodule HackathonApp.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :lastname, :string
      add :email, :string
      add :type, :string
      add :password, :string
      add :status, :integer

      timestamps()
    end

  end
end
