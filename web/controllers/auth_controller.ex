defmodule Gatherto.AuthController do
  use Gatherto.Web, :controller
  plug Ueberauth

  alias Ueberauth.Strategy.Helpers
  alias Gatherto.User

  def request(conn, _params) do
    render(conn, "request.html", callback_url: Helpers.callback_url(conn))
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    user = Map.from_struct(auth.info) |> get_or_create_user

    conn
    |> put_flash(:info, "Welcome #{user.first_name}")
    |> redirect(to: "/")
  end

  defp get_or_create_user(user_info) do
    case user = Repo.get_by(User, email: user_info.email) do
      nil ->
        changest = User.changeset(%User{}, user_info)
        Repo.insert!(changest)
      _ -> user
    end
  end
end

