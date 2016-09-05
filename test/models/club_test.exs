defmodule Gatherto.ClubTest do
  use Gatherto.ModelCase

  alias Gatherto.Club
  alias Gatherto.Athlete

  @valid_attrs %{description: "some content",
                 title: "some content",
                 location_id: "123"}
  @invalid_attrs %{}

  describe "a changeset" do
    test "with valid attributes" do
      changeset = Club.changeset(%Club{}, @valid_attrs)
      assert changeset.valid?
    end

    test "with invalid attributes" do
      changeset = Club.changeset(%Club{}, @invalid_attrs)
      refute changeset.valid?
    end

    test "without a unique title" do
      Club.changeset(%Club{}, Map.merge(@valid_attrs, %{title: "same_title"})) |> Repo.insert!
      changeset = Club.changeset(%Club{}, Map.merge(@valid_attrs, %{title: "same_title"}))
        |> Repo.insert
      assert {:error, _} = changeset
    end

    test "with an owner that exists" do
      athlete = Athlete.changeset(%Athlete{}, %{email: "some_email"}) |> Repo.insert! 
      changeset = Club.changeset(%Club{}, Map.merge(@valid_attrs, %{owner: athlete}))
        |> Repo.insert
      assert {:ok, _} = changeset
    end

    test "with an owner that does not exist" do
      changeset = Club.changeset(%Club{}, Map.merge(@valid_attrs, %{owner_id: -1}))
        |> Repo.insert
      assert {:error, _} = changeset
    end
  end
end
