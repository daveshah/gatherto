defmodule Gatherto.Repo.Migrations.AddPhoneToAthlete do
  use Ecto.Migration

  def change do
    alter table(:athletes) do
      add :phone, :string
    end
  end
end
