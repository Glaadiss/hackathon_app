defmodule HackathonApp.Core do
  @moduledoc """
  The Core context.
  """

  import Ecto.Query, warn: false
  alias HackathonApp.Repo

  alias HackathonApp.Core.Organization

  @doc """
  Returns the list of organizations.

  ## Examples

      iex> list_organizations()
      [%Organization{}, ...]

  """
  def list_organizations do
    Repo.all(Organization)
  end

  @doc """
  Gets a single organization.

  Raises `Ecto.NoResultsError` if the Organization does not exist.

  ## Examples

      iex> get_organization!(123)
      %Organization{}

      iex> get_organization!(456)
      ** (Ecto.NoResultsError)

  """
  def get_organization!(id), do: Repo.get!(Organization, id)

  @doc """
  Creates a organization.

  ## Examples

      iex> create_organization(%{field: value})
      {:ok, %Organization{}}

      iex> create_organization(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_organization(attrs \\ %{}) do
    %Organization{}
    |> Organization.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a organization.

  ## Examples

      iex> update_organization(organization, %{field: new_value})
      {:ok, %Organization{}}

      iex> update_organization(organization, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_organization(%Organization{} = organization, attrs) do
    organization
    |> Organization.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Organization.

  ## Examples

      iex> delete_organization(organization)
      {:ok, %Organization{}}

      iex> delete_organization(organization)
      {:error, %Ecto.Changeset{}}

  """
  def delete_organization(%Organization{} = organization) do
    Repo.delete(organization)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking organization changes.

  ## Examples

      iex> change_organization(organization)
      %Ecto.Changeset{source: %Organization{}}

  """
  def change_organization(%Organization{} = organization) do
    Organization.changeset(organization, %{})
  end

  alias HackathonApp.Core.Award

  @doc """
  Returns the list of awards.

  ## Examples

      iex> list_awards()
      [%Award{}, ...]

  """
  def list_awards do
    Repo.all(Award)
  end

  @doc """
  Gets a single award.

  Raises `Ecto.NoResultsError` if the Award does not exist.

  ## Examples

      iex> get_award!(123)
      %Award{}

      iex> get_award!(456)
      ** (Ecto.NoResultsError)

  """
  def get_award!(id), do: Repo.get!(Award, id)

  @doc """
  Creates a award.

  ## Examples

      iex> create_award(%{field: value})
      {:ok, %Award{}}

      iex> create_award(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_award(attrs \\ %{}) do
    %Award{}
    |> Award.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a award.

  ## Examples

      iex> update_award(award, %{field: new_value})
      {:ok, %Award{}}

      iex> update_award(award, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_award(%Award{} = award, attrs) do
    award
    |> Award.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Award.

  ## Examples

      iex> delete_award(award)
      {:ok, %Award{}}

      iex> delete_award(award)
      {:error, %Ecto.Changeset{}}

  """
  def delete_award(%Award{} = award) do
    Repo.delete(award)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking award changes.

  ## Examples

      iex> change_award(award)
      %Ecto.Changeset{source: %Award{}}

  """
  def change_award(%Award{} = award) do
    Award.changeset(award, %{})
  end
end
