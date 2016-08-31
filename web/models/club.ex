defmodule Gatherto.Club do
  use Gatherto.Web, :model

  schema "clubs" do
    field :title, :string
    field :description, :string
    belongs_to :owner, Gatherto.Athlete, foreign_key: :owner_id
    many_to_many :athletes, Gatherto.Athlete, join_through: Gatherto.AthleteClub
    many_to_many :runs, Gatherto.Run, join_through: Gatherto.RunClub

    timestamps()
  end

  @required_fields [:title]
  @optional_fields [:description]

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields, @optional_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:title)
  end
end
