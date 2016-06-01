defmodule Rnnr.UserTest do
  use Rnnr.ModelCase

  alias Rnnr.User

  @valid_attrs %{email: "some content", first_name: "some content", image: "some content", last_name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "find_or_create/1" do
    assert Repo.get_by(User, email: "foo@bar.com") == nil
    user = User.find_or_create(%{email: "foo@bar.com"})
    assert user.email == "foo@bar.com"
    assert Repo.get_by(User, email: "foo@bar.com") != nil
  end
end
