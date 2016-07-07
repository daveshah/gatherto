defmodule Gatherto.AthleteTest do
  use Gatherto.ModelCase

  alias Gatherto.Athlete

  @valid_attrs %{email: "some content", first_name: "some content", image_url: "some content", last_name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Athlete.changeset(%Athlete{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Athlete.changeset(%Athlete{}, @invalid_attrs)
    refute changeset.valid?
  end
end
