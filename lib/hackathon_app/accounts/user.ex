defmodule HackathonApp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias HackathonApp.Accounts.User
  @derive {Poison.Encoder, except: [:__meta__]}
  

  schema "users" do
    field :email, :string
    field :lastname, :string
    field :name, :string
    field :password, :string
    field :status, :integer
    field :type, :string
    # has_many :awards, HackathonApp.Core.Award    
    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :lastname, :email, :type, :password, :status])
    |> validate_required([ :email, :password])
    |> unique_constraint(:email)
  end
end
