defmodule Gatherto.Run do
  use Gatherto.Web, :model

  schema "runs" do
    field :title, :string
    field :time, Ecto.DateTime
    field :distance, :string
    field :location, :string
    field :pace, :string
    belongs_to :created_by, Gatherto.Athlete, foreign_key: :athlete_id
    many_to_many :athletes, Gatherto.Athlete, join_through: Gatherto.AthleteRun

    timestamps()
  end

  @required_params [:title, :time, :location]
  @optional_params [:distance, :pace]

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_params, @optional_params)
    |> validate_required(@required_params)
  end
end
