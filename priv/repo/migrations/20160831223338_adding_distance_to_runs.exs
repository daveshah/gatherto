defmodule Gatherto.Repo.Migrations.AddingDistanceToRuns do
  use Ecto.Migration

  def change do
    alter table(:runs) do
      add :minimum_distance, :integer
      add :maximum_distance, :integer
    end
  end
end
