defmodule HackathonApp.Repo.Migrations.CreateAwards do
  use Ecto.Migration

  def change do
    create table(:awards) do
      add :subject, :string
      add :topic, :string
      add :city, :string
      add :avatar, :string      
      add :authorFirstName, :string
      add :authorLastName, :string
      add :province, :string
      add :view_count, :integer
      add :value_to, :integer
      add :value_from, :integer
      add :body, :string
      add :state, :integer
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:awards, [:user_id])
  end
end


