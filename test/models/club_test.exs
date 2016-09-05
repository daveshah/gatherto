defmodule Gatherto.ClubTest do
  use Gatherto.ModelCase

  alias Gatherto.Club

  @valid_attrs %{description: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Club.changeset(%Club{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Club.changeset(%Club{}, @invalid_attrs)
    refute changeset.valid?
  end
end
