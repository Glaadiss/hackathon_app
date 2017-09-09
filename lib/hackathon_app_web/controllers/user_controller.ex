defmodule HackathonAppWeb.UserController do
  use HackathonAppWeb, :controller
  alias HackathonApp.Accounts
  alias HackathonApp.Accounts.User
  alias HackathonApp.Core.Organization
  alias HackathonApp.Core
  action_fallback HackathonAppWeb.FallbackController

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, params) do
    %{"user" => user_params} = params
  
    organization = findOrganization user_params 
    if organization do
      user_params = Map.put(user_params, "user_id", organization.id)
    else
      organization = getOrganizations user_params
      user_params = create_organization_and_user(organization, user_params)
    end

    with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def create_organization_and_user(organization, user_params) do
    IO.inspect organization
    IO.inspect user_params
    cond do
      organization -> 
        {:ok, new_organization}= Core.create_organization organization
        Map.put(user_params, "user_id", new_organization.id)        
      true -> 
        nil
    end
  end

  def findOrganization(%{"nip" => nip}) do 
    HackathonApp.Repo.get_by(Organization, nip: nip)
  end

  def getOrganizations(%{"nip" => nip}) do
    data = HTTPoison.get! "https://api-v3.mojepanstwo.pl/dane/krs_podmioty.json?conditions[krs_podmioty.nip]=#{nip}"
    decoded = Poison.decode!(data.body)
    obj = List.first decoded["Dataobject"]
    if obj do
      %{name: obj["data"]["krs_podmioty.nazwa_skrocona"], address: obj["data"]["krs_podmioty.adres"], nip: nip}
    else
      nil
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
