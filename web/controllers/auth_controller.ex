defmodule Rnnr.AuthController do
  use Rnnr.Web, :controller
  plug Ueberauth

  alias Ueberauth.Strategy.Helpers
  alias Rnnr.User

  def request(conn, _params) do
    render(conn, "request.html", callback_url: Helpers.callback_url(conn))
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    info = Map.from_struct(auth.info)
    changest = User.changeset(%User{}, info)
    Repo.insert(changest)
    conn
  end
end

