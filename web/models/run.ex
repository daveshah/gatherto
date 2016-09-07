defmodule Gatherto.Run do
  use Gatherto.Web, :model

  schema "runs" do
    field :title, :string
    field :description, :string
    field :time, Ecto.DateTime
    field :minimum_distance, :integer
    field :maximum_distance, :integer
    field :location_id, :string
    belongs_to :created_by, Gatherto.Athlete, foreign_key: :athlete_id
    many_to_many :athletes, Gatherto.Athlete, join_through: Gatherto.AthleteRun
    many_to_many :clubs, Gatherto.Club, join_through: Gatherto.AthleteClub

    timestamps()
  end

  @required_params [:title, :description, :time]
  @optional_params [:minimum_distance, :maximum_distance, :location_id]

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_params, @optional_params)
    |> validate_required(@required_params)
    |> validate_number(:minimum_distance, greater_than: 0)
    |> validate_number(:maximum_distance, greater_than: 0)
    |> validate_distance_range
  end

  defp validate_distance_range(changeset) do
    min_dist = get_field(changeset, :minimum_distance)
    max_dist = get_field(changeset, :maximum_distance)
    validate_distance_range(changeset, min_dist, max_dist)
  end

  defp validate_distance_range(changeset, min_dist, max_dist) when is_integer(min_dist) and is_integer(max_dist) and min_dist > max_dist do
    add_error(changeset, :minimum_distance, "minimum distance cannot be more than maximum")
  end
  defp validate_distance_range(changeset, _, _), do: changeset
end
