defmodule Gatherto.User do
  use Gatherto.Web, :model

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :image, :string
    many_to_many :runs, Gatherto.Run, join_through: Gatherto.UserRun

    timestamps()
  end

  @required_fields ~w(email)a
  @optional_fields ~w(first_name last_name image)a

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields, @optional_fields)
    |> validate_required(@required_fields)
  end
end
