defmodule Gatherto.UserRunTest do
  use Gatherto.ModelCase

  alias Gatherto.UserRun

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = UserRun.changeset(%UserRun{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = UserRun.changeset(%UserRun{}, @invalid_attrs)
    refute changeset.valid?
  end
end
