defmodule Gatherto.UserRun do
  use Ecto.Schema

  schema "users_runs" do
    field :user_id, :binary_id
    field :run_id, :binary_id

    timestamps()
  end
end
