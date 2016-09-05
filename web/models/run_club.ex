defmodule Gatherto.RunClub do
  use Ecto.Schema

  schema "runs_clubs" do
    belongs_to :run, Gatherto.Run
    belongs_to :club, Gatherto.Club

    timestamps()
  end
end
