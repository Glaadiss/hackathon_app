defmodule HackathonApp.Core.Award do
  use Ecto.Schema
  import Ecto.Changeset
  alias HackathonApp.Core.Award
  use Arc.Ecto.Schema
  

  schema "awards" do
    field :subject, :string
    field :topic, :string
    field :city, :string
    field :authorFirstName, :string
    field :authorLastName, :string
    field :province, :string
    field :view_count, :integer
    field :value_to, :integer
    field :value_from, :integer
    field :body, :string
    field :state, :integer
    field :user_id, :id
    field :avatar, HackathonApp.Avatar.Type
    
    # belongs_to :user, HackathonApp.Accounts.User
    timestamps()
  end

  @doc false
  def changeset(%Award{} = award, attrs) do
    award
    |> cast(attrs, [:topic, :subject, :city, :authorFirstName, :authorLastName, :province, :view_count, :body, :state, :value_to, :value_from, :user_id])
    |> cast_attachments(attrs, [:avatar])    
    |> validate_required([:topic, :user_id])
  end
end
