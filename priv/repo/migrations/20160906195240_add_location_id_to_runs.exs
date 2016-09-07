defmodule Gatherto.Repo.Migrations.AddLocationIdToRuns do
  use Ecto.Migration

  def change do
    alter table(:runs) do
      add :location_id, :string
    end
  end
end
