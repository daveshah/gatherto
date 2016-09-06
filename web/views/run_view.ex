defmodule Gatherto.RunView do
  use Gatherto.Web, :view

  alias Gatherto.Run

  @default_unit "mile"

  def distance_display(%Run{minimum_distance: nil,
                            maximum_distance: nil}), do: ""
  def distance_display(%Run{minimum_distance: distance,
                            maximum_distance: nil}), do: single_distance(distance)
  def distance_display(%Run{minimum_distance: nil,
                            maximum_distance: distance}), do: single_distance(distance)
  def distance_display(%Run{minimum_distance: distance,
                            maximum_distance: distance}), do: single_distance(distance)
  def distance_display(%Run{minimum_distance: min_distance,
                            maximum_distance: max_distance}) do
    distance_range(min_distance, max_distance)
  end

  defp single_distance(distance, units \\ @default_unit), do: "#{distance} #{units}(s)."
  defp distance_range(min_distance, max_distance, units \\ @default_unit) do
    "#{min_distance} to #{max_distance} #{units}s."
  end

end
