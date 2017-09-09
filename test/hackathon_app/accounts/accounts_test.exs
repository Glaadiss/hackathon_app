defmodule HackathonApp.AccountsTest do
  use HackathonApp.DataCase

  alias HackathonApp.Accounts

  describe "users" do
    alias HackathonApp.Accounts.User

    @valid_attrs %{email: "some email", lastname: "some lastname", name: "some name", password: "some password", status: 42, type: "some type"}
    @update_attrs %{email: "some updated email", lastname: "some updated lastname", name: "some updated name", password: "some updated password", status: 43, type: "some updated type"}
    @invalid_attrs %{email: nil, lastname: nil, name: nil, password: nil, status: nil, type: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.lastname == "some lastname"
      assert user.name == "some name"
      assert user.password == "some password"
      assert user.status == 42
      assert user.type == "some type"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.email == "some updated email"
      assert user.lastname == "some updated lastname"
      assert user.name == "some updated name"
      assert user.password == "some updated password"
      assert user.status == 43
      assert user.type == "some updated type"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "comments" do
    alias HackathonApp.Accounts.Comment

    @valid_attrs %{author: "some author", title: "some title"}
    @update_attrs %{author: "some updated author", title: "some updated title"}
    @invalid_attrs %{author: nil, title: nil}

    def comment_fixture(attrs \\ %{}) do
      {:ok, comment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_comment()

      comment
    end

    test "list_comments/0 returns all comments" do
      comment = comment_fixture()
      assert Accounts.list_comments() == [comment]
    end

    test "get_comment!/1 returns the comment with given id" do
      comment = comment_fixture()
      assert Accounts.get_comment!(comment.id) == comment
    end

    test "create_comment/1 with valid data creates a comment" do
      assert {:ok, %Comment{} = comment} = Accounts.create_comment(@valid_attrs)
      assert comment.author == "some author"
      assert comment.title == "some title"
    end

    test "create_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_comment(@invalid_attrs)
    end

    test "update_comment/2 with valid data updates the comment" do
      comment = comment_fixture()
      assert {:ok, comment} = Accounts.update_comment(comment, @update_attrs)
      assert %Comment{} = comment
      assert comment.author == "some updated author"
      assert comment.title == "some updated title"
    end

    test "update_comment/2 with invalid data returns error changeset" do
      comment = comment_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_comment(comment, @invalid_attrs)
      assert comment == Accounts.get_comment!(comment.id)
    end

    test "delete_comment/1 deletes the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{}} = Accounts.delete_comment(comment)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_comment!(comment.id) end
    end

    test "change_comment/1 returns a comment changeset" do
      comment = comment_fixture()
      assert %Ecto.Changeset{} = Accounts.change_comment(comment)
    end
  end
end
