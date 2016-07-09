defmodule Gatherto.Repo.Migrations.UniqueEmailsForAthletes do
  use Ecto.Migration

  def change do
    create unique_index(:athletes, [:email])
  end
end
