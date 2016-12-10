defmodule Gatherto.GuardianSerializer do
  @behaviour Guardian.Serializer

  alias Gatherto.Repo
  alias Gatherto.Athlete

  def for_token(athlete = %Athlete{}), do: { :ok, "Athlete:#{athlete.id}"}
  def for_token(_), do: { :error, "Unknown resource type "}

  def from_token("Athlete:" <> id), do: { :ok, Repo.get(Athlete, id) }
  def from_token(_), do: { :error, "Unknown resource type" }
end
