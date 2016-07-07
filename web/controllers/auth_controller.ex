defmodule Gatherto.AuthController do
  use Gatherto.Web, :controller
  plug Ueberauth

  alias Ueberauth.Strategy.Helpers
  alias Gatherto.Athlete

  def request(conn, _params) do
    render(conn, "request.html", callback_url: Helpers.callback_url(conn))
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    athlete = Map.from_struct(auth.info)
              |> map_from_strava
              |> get_or_create_athlete

    conn
    |> put_flash(:info, "Welcome #{athlete.first_name}")
    |> redirect(to: "/")
  end

  defp map_from_strava(map) do
    case Map.pop(map, :image) do
      {nil, map} -> map
      {url, map} -> Map.put(map, :image_url, url)
    end
  end

  defp get_or_create_athlete(athlete_info) do
    case user = Repo.get_by(Athlete, email: athlete_info.email) do
      nil ->

        Athlete.changeset(%Athlete{}, athlete_info)
        |> Repo.insert!()
      _ -> user
    end
  end
end

