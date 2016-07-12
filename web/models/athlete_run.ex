defmodule Gatherto.AthleteRun do
  use Ecto.Schema

  schema "athletes_runs" do
    belongs_to :athlete, Gatherto.Athlete
    belongs_to :run, Gatherto.Run
    timestamps()
  end
end
