defmodule Gatherto.UserRun do
  use Ecto.Schema

  schema "users_runs" do
    belongs_to :user, Gatherto.User
    belongs_to :run, Gatherto.Run
    timestamps()
  end
end
