defmodule Gatherto.AthleteClub do
  use Ecto.Schema

  schema "athletes_runs" do
    belongs_to :athlete, Gatherto.Athlete
    belongs_to :club, Gatherto.Club

    timestamps()
  end
end
