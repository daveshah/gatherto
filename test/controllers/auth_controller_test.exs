defmodule Rnnr.AuthControllerTest do
  use Rnnr.ConnCase
  alias Rnnr.Repo
  alias Rnnr.User

  @auth %Ueberauth.Auth{info: %Ueberauth.Auth.Info{email: "test@test.com"}}

  test "user creation on callback", %{conn: conn} do
    conn
    |> Plug.Conn.assign(:ueberauth_auth, @auth) 
    |> get("/auth/strava/callback")

    assert Repo.all(User) |> Enum.count == 1
  end
end
