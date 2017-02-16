defmodule Gatherto.Dates do
  def date_time(%{"date" => date, "time" => time} = map, key) do
    map
    |> Map.drop(["date", "time"])
    |> Map.merge(%{ key => "#{date} #{time}:00" })
  end
  def date_time(map, _), do: map
end
