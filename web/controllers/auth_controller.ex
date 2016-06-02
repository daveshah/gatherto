defmodule Rnnr.AuthController do
  use Rnnr.Web, :controller
  plug Ueberauth

  alias Ueberauth.Strategy.Helpers
  alias Rnnr.User

  def request(conn, _params) do
    render(conn, "request.html", callback_url: Helpers.callback_url(conn))
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    Map.from_struct(auth.info)
    |> get_or_create_user
    conn
  end

  defp get_or_create_user(user_info) do
    case Repo.get_by(User, email: user_info.email) do
      nil ->
        changest = User.changeset(%User{}, user_info)
        Repo.insert(changest)
      _ -> nil
    end
  end
end

