defmodule Gatherto.Repo.Migrations.AddAthletesRunsUniqunessConstraint do
  use Ecto.Migration

  def change do
    create unique_index(:athletes_runs, [:athlete_id, :run_id])
  end
end
