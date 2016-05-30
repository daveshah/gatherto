defmodule Rnnr.AuthController do
  use Rnnr.Web, :controller
  plug Ueberauth

  alias Ueberauth.Strategy.Helpers

  def request(conn, _params) do
    render(conn, "request.html", callback_url: Helpers.callback_url(conn))
  end

  def identity_callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    case User.find_or_create(auth.credentials) do
      :ok -> conn
      { :error, reason } -> conn
    end
  end

end
