defmodule Gatherto.Repo.Migrations.ChangeRuns do
  use Ecto.Migration

  def change do
    alter table(:runs) do
      remove :description
      remove :minimum_distance
      remove :maximum_distance
      remove :location_id
      add :location, :string
      add :pace, :string
      add :distance, :string
    end
  end
end
