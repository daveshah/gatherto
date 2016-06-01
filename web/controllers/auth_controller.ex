defmodule Rnnr.AuthController do
  use Rnnr.Web, :controller
  plug Ueberauth

  alias Ueberauth.Strategy.Helpers
  alias Rnnr.User

  def request(conn, _params) do
    render(conn, "request.html", callback_url: Helpers.callback_url(conn))
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    case User.find_or_create(auth.info) do
      :ok -> conn
      { :error, reason } -> conn
    end
  end
end

