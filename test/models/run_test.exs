defmodule Gatherto.RunTest do
  use Gatherto.ModelCase

  alias Gatherto.Run

  @valid_attrs %{title: "some content",
                 time: %{day: 12, hour: 14, min: 0, month: 8, sec: 0, year: 2018},
                 distance: "10 miles",
                 pace: "10 mph",
                 location: "Best place ever"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Run.changeset(%Run{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Run.changeset(%Run{}, @invalid_attrs)
    refute changeset.valid?
  end

  describe "persistance" do
    test "a run with valid attributes" do
      Run.changeset(%Run{}, @valid_attrs) |> Repo.insert!

      assert Repo.get_by!(Run, @valid_attrs)
    end
  end
end
