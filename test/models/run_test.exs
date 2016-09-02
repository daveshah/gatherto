defmodule Gatherto.RunTest do
  use Gatherto.ModelCase

  alias Gatherto.Run

  @valid_attrs %{description: "some content",
                 title: "some content",
                 time: %{day: 12, hour: 14, min: 0, month: 8, sec: 0, year: 2018},
                 minimum_distance: 10,
                 maximum_distance: 15}
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

  describe "run distance constraints" do
    test "a run can have no distances" do
      valid_empty_distance = Map.merge(@valid_attrs, %{minimum_distance: nil,
                                                       maximum_distance: nil})
      changeset = Run.changeset(%Run{}, valid_empty_distance)
      assert changeset.valid?
    end

    test "a run can't have a negative minimum distance" do
      invalid_min = Map.merge(@valid_attrs, %{minimum_distance: -1})
      changeset = Run.changeset(%Run{}, invalid_min)
      refute changeset.valid?
    end

    test "a run can't have a negative maximum distance" do
      invalid_max = Map.merge(@valid_attrs, %{maximum_distance: -1})
      changeset = Run.changeset(%Run{}, invalid_max)
      refute changeset.valid?
    end

    test "a run can't have a larger minimum distance than maximum distance" do
      invalid_distance = Map.merge(@valid_attrs, %{minimum_distance: 2,
                                                   maximum_distance: 1})
      changeset = Run.changeset(%Run{}, invalid_distance)
      refute changeset.valid?
    end
  end
end
