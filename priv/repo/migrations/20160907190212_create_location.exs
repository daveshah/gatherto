defmodule Gatherto.Repo.Migrations.CreateLocation do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :postal_code, :string
      add :state, :string
      add :city, :string
      add :latitude, :float
      add :longitude, :float

      timestamps()
    end

  end
end
