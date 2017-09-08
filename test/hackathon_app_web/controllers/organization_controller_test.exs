defmodule HackathonAppWeb.OrganizationControllerTest do
  use HackathonAppWeb.ConnCase

  alias HackathonApp.Core
  alias HackathonApp.Core.Organization

  @create_attrs %{name: "some name", nip: "some nip", type: "some type"}
  @update_attrs %{name: "some updated name", nip: "some updated nip", type: "some updated type"}
  @invalid_attrs %{name: nil, nip: nil, type: nil}

  def fixture(:organization) do
    {:ok, organization} = Core.create_organization(@create_attrs)
    organization
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all organizations", %{conn: conn} do
      conn = get conn, organization_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create organization" do
    test "renders organization when data is valid", %{conn: conn} do
      conn = post conn, organization_path(conn, :create), organization: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, organization_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some name",
        "nip" => "some nip",
        "type" => "some type"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, organization_path(conn, :create), organization: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update organization" do
    setup [:create_organization]

    test "renders organization when data is valid", %{conn: conn, organization: %Organization{id: id} = organization} do
      conn = put conn, organization_path(conn, :update, organization), organization: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, organization_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some updated name",
        "nip" => "some updated nip",
        "type" => "some updated type"}
    end

    test "renders errors when data is invalid", %{conn: conn, organization: organization} do
      conn = put conn, organization_path(conn, :update, organization), organization: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete organization" do
    setup [:create_organization]

    test "deletes chosen organization", %{conn: conn, organization: organization} do
      conn = delete conn, organization_path(conn, :delete, organization)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, organization_path(conn, :show, organization)
      end
    end
  end

  defp create_organization(_) do
    organization = fixture(:organization)
    {:ok, organization: organization}
  end
end
