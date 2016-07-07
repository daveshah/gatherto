defmodule Gatherto.Repo.Migrations.CreateAthlete do
  use Ecto.Migration

  def change do
    create table(:athletes) do
      add :email, :string
      add :first_name, :string
      add :last_name, :string
      add :image_url, :string

      timestamps()
    end

  end
end
