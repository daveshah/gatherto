defmodule Gatherto.Athlete do
  use Gatherto.Web, :model

  schema "athletes" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :image_url, :string
    field :phone, :string
    has_many :posted_runs, Gatherto.Run
    many_to_many :runs, Gatherto.Run, join_through: Gatherto.AthleteRun

    timestamps()
  end

  #TODO: this will changup auth and need to format properly too
  @required_params [:phone]
  @optional_params [:first_name, :last_name, :image_url, :phone]

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_params, @optional_params)
    |> validate_required(@required_params)
    |> unique_constraint(:phone)
  end
end
