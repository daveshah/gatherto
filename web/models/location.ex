defmodule Gatherto.Location do
  use Gatherto.Web, :model

  schema "locations" do
    field :postal_code, :string
    field :state, :string
    field :city, :string
    field :latitude, :float
    field :longitude, :float

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:postal_code, :state, :city, :latitude, :longitude])
    |> validate_required([:postal_code, :state, :city, :latitude, :longitude])
  end
end
