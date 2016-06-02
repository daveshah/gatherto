defmodule Rnnr.User do
  use Rnnr.Web, :model
  alias Rnnr.Repo

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :image, :string

    timestamps
  end

  @required_fields ~w(email)
  @optional_fields ~w(first_name last_name image)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
