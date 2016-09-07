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

# Runs
Gatherto.Repo.insert!(
  %Gatherto.Run{
  title: "Sunday Morning Run",
  description: "Long run",
  time: Ecto.DateTime.cast!("2018-08-12 06:30:00"),
  location_id: "ChIJxV1Rm5DyMIgRR8Tfyyb__Cc",
  minimum_distance: 20})
