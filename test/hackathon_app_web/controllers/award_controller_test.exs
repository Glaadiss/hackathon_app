defmodule HackathonAppWeb.AwardControllerTest do
  use HackathonAppWeb.ConnCase

  alias HackathonApp.Core
  alias HackathonApp.Core.Award

  @create_attrs %{body: "some body", status: 42, title: "some title", view_count: 42}
  @update_attrs %{body: "some updated body", status: 43, title: "some updated title", view_count: 43}
  @invalid_attrs %{body: nil, status: nil, title: nil, view_count: nil}

  def fixture(:award) do
    {:ok, award} = Core.create_award(@create_attrs)
    award
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all awards", %{conn: conn} do
      conn = get conn, award_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create award" do
    test "renders award when data is valid", %{conn: conn} do
      conn = post conn, award_path(conn, :create), award: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, award_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "body" => "some body",
        "status" => 42,
        "title" => "some title",
        "view_count" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, award_path(conn, :create), award: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update award" do
    setup [:create_award]

    test "renders award when data is valid", %{conn: conn, award: %Award{id: id} = award} do
      conn = put conn, award_path(conn, :update, award), award: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, award_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "body" => "some updated body",
        "status" => 43,
        "title" => "some updated title",
        "view_count" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, award: award} do
      conn = put conn, award_path(conn, :update, award), award: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete award" do
    setup [:create_award]

    test "deletes chosen award", %{conn: conn, award: award} do
      conn = delete conn, award_path(conn, :delete, award)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, award_path(conn, :show, award)
      end
    end
  end

  defp create_award(_) do
    award = fixture(:award)
    {:ok, award: award}
  end
end
