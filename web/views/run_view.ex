defmodule Gatherto.RunView do
  use Gatherto.Web, :view

  alias Gatherto.Run

  def distance_display(%Run{minimum_distance: nil, maximum_distance: nil}), do: ""
  def distance_display(%Run{minimum_distance: distance, maximum_distance: nil}), do: "#{distance}"
  def distance_display(%Run{minimum_distance: nil, maximum_distance: distance}), do: "#{distance}"
  def distance_display(%Run{minimum_distance: min_distance,
                            maximum_distance: max_distance}), do: "#{min_distance} to #{max_distance}"

end
