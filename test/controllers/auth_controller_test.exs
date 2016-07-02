defmodule Gatherto.AuthControllerTest do
  use Gatherto.ConnCase
  alias Gatherto.Repo
  alias Gatherto.User

  @auth %Ueberauth.Auth{info: %Ueberauth.Auth.Info{email: "test@test.com"}}

  test "user creation on callback", %{conn: conn} do
    conn
    |> Plug.Conn.assign(:ueberauth_auth, @auth) 
    |> get("/auth/strava/callback")

    assert the_count_of(User) == 1
  end

  test "user retreival on callback", %{conn: conn} do
    Repo.insert!(%User{email: @auth.info.email})

    conn
    |> Plug.Conn.assign(:ueberauth_auth, @auth)
    |> get("/auth/strava/callback")

    assert the_count_of(User) == 1
  end

  defp the_count_of(schema) do
    Repo.all(schema) |> Enum.count
  end
  
end
