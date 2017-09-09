defmodule HackathonApp.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :title, :string
      add :author, :string
      add :user_id, references(:users, on_delete: :nothing)
      add :award_id, references(:awards, on_delete: :nothing)

      timestamps()
    end

    create index(:comments, [:user_id])
    create index(:comments, [:award_id])
  end
end
