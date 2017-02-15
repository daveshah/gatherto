defmodule Gatherto.Repo.Migrations.DropClubs do
  use Ecto.Migration

  def change do
    drop_if_exists table(:athletes_clubs)
    drop_if_exists table(:runs_clubs)
    drop_if_exists table(:clubs)
  end
end
