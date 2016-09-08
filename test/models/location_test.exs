defmodule Gatherto.LocationTest do
  use Gatherto.ModelCase

  alias Gatherto.Location

  @valid_attrs %{city: "some content", latitude: "120.5", longitude: "120.5", postal_code: "some content", state: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Location.changeset(%Location{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Location.changeset(%Location{}, @invalid_attrs)
    refute changeset.valid?
  end
end
