defmodule Gatherto.Run do
  use Gatherto.Web, :model

  schema "runs" do
    field :title, :string
    field :description, :string
    field :time, Ecto.DateTime
    belongs_to :created_by, Gatherto.Athlete, foreign_key: :athlete_id
    many_to_many :athletes, Gatherto.Athlete, join_through: Gatherto.AthleteRun
    many_to_many :clubs, Gatherto.Club, join_through: Gatherto.AthleteClub

    timestamps()
  end

  @required_params [:title, :description, :time]

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
