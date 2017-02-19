defmodule Gatherto.AthleteTest do
  use Gatherto.ModelCase

  alias Gatherto.Athlete

  @valid_attrs %{email: "some content", first_name: "some content", image_url: "some content", last_name: "some content", phone: "5555555"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Athlete.changeset(%Athlete{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Athlete.changeset(%Athlete{}, @invalid_attrs)
    refute changeset.valid?
  end

  #test "phone uniqueness" do
  #  phone = "4405555555"

  #  Repo.insert!(%Athlete{phone: phone})
  #  assert Repo.all(Athlete) |> length() == 1

  #  assert_raise Ecto.ConstraintError, fn ->
  #    Repo.insert(%Athlete{phone: phone})
  #  end
  #end

  describe "relationships" do
    #test "adding runs" do
    #  run = %Run{title: "Best run ever", description: "long and fast"}
    #  athlete = Repo.insert!(%Athlete{email: "test@email.com"})
    #  changeset = Athlete.add_run_changeset(athlete, run)

    #  {:ok, changed_athlete} = Repo.update(changeset)
    #end
  end
end
