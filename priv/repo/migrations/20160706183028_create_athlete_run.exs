defmodule Gatherto.Repo.Migrations.CreateAthleteRun do
  use Ecto.Migration

  def change do
    create table(:athletes_runs) do
      add :run_id, references(:runs)
      add :athlete_id, references(:athletes)

      timestamps()
    end

  end
end
