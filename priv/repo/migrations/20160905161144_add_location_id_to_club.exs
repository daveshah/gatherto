defmodule Gatherto.Repo.Migrations.AddLocationToClub do
  use Ecto.Migration

  def change do
    alter table(:clubs) do
      add :location_id, :string
    end
  end
end
