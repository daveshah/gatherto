defmodule Gatherto.Repo.Migrations.AddDatetimeToRuns do
  use Ecto.Migration

  def change do
    alter table(:runs) do
      add :time, :datetime
    end
  end
end
