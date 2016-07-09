defmodule Gatherto.Repo.Migrations.AddPosterToRuns do
  use Ecto.Migration

  def change do
    alter table(:runs) do
      add :athlete_id, references(:athletes)
    end
  end
end
