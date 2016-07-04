defmodule Gatherto.Repo.Migrations.CreateUserRun do
  use Ecto.Migration

  def change do
    create table(:users_runs) do
      add :user_id, references(:users)
      add :run_id, references(:runs)

      timestamps()
    end

  end
end
