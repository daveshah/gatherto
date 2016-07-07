defmodule Gatherto.Run do
  use Gatherto.Web, :model

  schema "runs" do
    field :title, :string
    field :description, :string
    many_to_many :athletes, Gatherto.Athlete, join_through: Gatherto.AthleteRun

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description])
    |> validate_required([:title, :description])
  end
end
