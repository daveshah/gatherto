defmodule Gatherto.AuthControllerTest do
  use Gatherto.ConnCase
  alias Gatherto.Repo
  alias Gatherto.Athlete

  @auth %Ueberauth.Auth{info: %Ueberauth.Auth.Info{email: "test@test.com",
                                                   image: "http://awesome.com",
                                                   first_name: "firsty",
                                                   phone: "4405555555",
                                                   last_name: "lasty"}}

  describe "Strava auth" do
    #test "user creation on callback", %{conn: conn} do
    #  conn
    #  |> Plug.Conn.assign(:ueberauth_auth, @auth)
    #  |> get("/auth/strava/callback")

    #  assert the_count_of(Athlete) == 1

    #  athlete = the_first(Athlete)
    #  assert athlete.email == @auth.info.email
    #  assert athlete.first_name == @auth.info.first_name
    #  assert athlete.last_name == @auth.info.last_name
    #  assert athlete.image_url == @auth.info.image
    #end

    #test "user retreival on callback", %{conn: conn} do
    #  Repo.insert!(%Athlete{email: @auth.info.email})

    #  conn
    #  |> Plug.Conn.assign(:ueberauth_auth, @auth)
    #  |> get("/auth/strava/callback")

    #  assert the_count_of(Athlete) == 1
    #end
  end

  defp the_count_of(schema) do
    Repo.all(schema) |> Enum.count
  end

  def the_first(schema) do
    Repo.all(schema) |> List.first
  end
end
