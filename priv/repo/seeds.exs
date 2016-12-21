# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Gatherto.Repo.insert!(%Gatherto.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule LocationMapper do
  def map(list) do
    {latitude, _ } = Enum.at(list, 3) |> Float.parse
    {longitude, _ } = Enum.at(list, 4) |> Float.parse
    state = Enum.at(list, 0) |> String.upcase
    city = Enum.at(list, 1) |> String.upcase
    postal_code = Enum.at(list, 2)

    %Gatherto.Location{
      state: state,
      city: city,
      postal_code: postal_code,
      latitude: latitude,
      longitude: longitude }
  end

  def add_locations_from!(csv) do
    #TIL: (ArgumentError) postgresql protocol can not handle 128860 parameters, the maximum is 65535
    # so - insert_all with a named list was a tad bit too long ;)
    File.stream!("priv/repo/locations.csv")
    |> Enum.map(&(String.trim(&1) |> String.split(",") |> LocationMapper.map))
    |> Enum.each( fn(loc) -> Gatherto.Repo.insert!(loc) end)
  end
end

# Runs
Gatherto.Repo.insert!(
  %Gatherto.Run{
  title: "Sunday Morning Run",
  description: "Long run",
  time: Ecto.DateTime.cast!("2018-08-12 06:30:00"),
  location_id: "ChIJxV1Rm5DyMIgRR8Tfyyb__Cc",
  minimum_distance: 20})


#Locations
LocationMapper.add_locations_from!("priv/repo/locations.csv")
