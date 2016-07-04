defmodule Gatherto.Repo.Migrations.CreateRun do
  use Ecto.Migration

  def change do
    create table(:runs) do
      add :title, :string
      add :description, :string

      timestamps()
    end
  end
end
