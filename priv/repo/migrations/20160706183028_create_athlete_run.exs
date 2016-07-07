defmodule Gatherto.Repo.Migrations.CreateAthleteRun do
  use Ecto.Migration

  def change do
    create table(:athletes_runs) do

      timestamps()
    end

  end
end
