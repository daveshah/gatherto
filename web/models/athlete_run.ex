defmodule Gatherto.AthleteRun do
  use Ecto.Schema

  schema "athletes_runs" do
    belongs_to :athlete, Gatherto.AthleteRun
    belongs_to :run, Gatherto.Run
    timestamps()
  end
end
