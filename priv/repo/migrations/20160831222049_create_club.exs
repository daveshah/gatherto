defmodule Gatherto.Repo.Migrations.CreateClub do
  use Ecto.Migration

  def change do
    create table(:clubs) do
      add :title, :string
      add :description, :string
      add :owner_id, references(:athletes)

      timestamps()
    end

    create unique_index(:clubs, [:title])

    create table(:athletes_clubs) do
      add :athlete_id, references(:athletes)
      add :club_id, references(:clubs)

      timestamps()
    end

    create unique_index(:athletes_clubs, [:athlete_id, :club_id])

    create table(:runs_clubs) do
      add :run_id, references(:runs)
      add :club_id, references(:clubs)

      timestamps()
    end

    create unique_index(:runs_clubs, [:run_id, :club_id])

  end
end
