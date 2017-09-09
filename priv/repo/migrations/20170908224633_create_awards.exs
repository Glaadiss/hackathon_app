defmodule HackathonApp.Repo.Migrations.CreateAwards do
  use Ecto.Migration

  def change do
    create table(:awards) do
      add :title, :string
      add :view_count, :integer
      add :body, :string
      add :status, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:awards, [:user_id])
  end
end
