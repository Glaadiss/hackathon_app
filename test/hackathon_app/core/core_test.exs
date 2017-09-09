defmodule HackathonApp.CoreTest do
  use HackathonApp.DataCase

  alias HackathonApp.Core

  describe "organizations" do
    alias HackathonApp.Core.Organization

    @valid_attrs %{name: "some name", nip: "some nip", type: "some type"}
    @update_attrs %{name: "some updated name", nip: "some updated nip", type: "some updated type"}
    @invalid_attrs %{name: nil, nip: nil, type: nil}

    def organization_fixture(attrs \\ %{}) do
      {:ok, organization} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Core.create_organization()

      organization
    end

    test "list_organizations/0 returns all organizations" do
      organization = organization_fixture()
      assert Core.list_organizations() == [organization]
    end

    test "get_organization!/1 returns the organization with given id" do
      organization = organization_fixture()
      assert Core.get_organization!(organization.id) == organization
    end

    test "create_organization/1 with valid data creates a organization" do
      assert {:ok, %Organization{} = organization} = Core.create_organization(@valid_attrs)
      assert organization.name == "some name"
      assert organization.nip == "some nip"
      assert organization.type == "some type"
    end

    test "create_organization/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_organization(@invalid_attrs)
    end

    test "update_organization/2 with valid data updates the organization" do
      organization = organization_fixture()
      assert {:ok, organization} = Core.update_organization(organization, @update_attrs)
      assert %Organization{} = organization
      assert organization.name == "some updated name"
      assert organization.nip == "some updated nip"
      assert organization.type == "some updated type"
    end

    test "update_organization/2 with invalid data returns error changeset" do
      organization = organization_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_organization(organization, @invalid_attrs)
      assert organization == Core.get_organization!(organization.id)
    end

    test "delete_organization/1 deletes the organization" do
      organization = organization_fixture()
      assert {:ok, %Organization{}} = Core.delete_organization(organization)
      assert_raise Ecto.NoResultsError, fn -> Core.get_organization!(organization.id) end
    end

    test "change_organization/1 returns a organization changeset" do
      organization = organization_fixture()
      assert %Ecto.Changeset{} = Core.change_organization(organization)
    end
  end

  describe "awards" do
    alias HackathonApp.Core.Award

    @valid_attrs %{body: "some body", status: 42, title: "some title", view_count: 42}
    @update_attrs %{body: "some updated body", status: 43, title: "some updated title", view_count: 43}
    @invalid_attrs %{body: nil, status: nil, title: nil, view_count: nil}

    def award_fixture(attrs \\ %{}) do
      {:ok, award} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Core.create_award()

      award
    end

    test "list_awards/0 returns all awards" do
      award = award_fixture()
      assert Core.list_awards() == [award]
    end

    test "get_award!/1 returns the award with given id" do
      award = award_fixture()
      assert Core.get_award!(award.id) == award
    end

    test "create_award/1 with valid data creates a award" do
      assert {:ok, %Award{} = award} = Core.create_award(@valid_attrs)
      assert award.body == "some body"
      assert award.status == 42
      assert award.title == "some title"
      assert award.view_count == 42
    end

    test "create_award/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_award(@invalid_attrs)
    end

    test "update_award/2 with valid data updates the award" do
      award = award_fixture()
      assert {:ok, award} = Core.update_award(award, @update_attrs)
      assert %Award{} = award
      assert award.body == "some updated body"
      assert award.status == 43
      assert award.title == "some updated title"
      assert award.view_count == 43
    end

    test "update_award/2 with invalid data returns error changeset" do
      award = award_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_award(award, @invalid_attrs)
      assert award == Core.get_award!(award.id)
    end

    test "delete_award/1 deletes the award" do
      award = award_fixture()
      assert {:ok, %Award{}} = Core.delete_award(award)
      assert_raise Ecto.NoResultsError, fn -> Core.get_award!(award.id) end
    end

    test "change_award/1 returns a award changeset" do
      award = award_fixture()
      assert %Ecto.Changeset{} = Core.change_award(award)
    end
  end
end
