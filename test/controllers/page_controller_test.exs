defmodule Rnnr.PageControllerTest do
  use Rnnr.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert page_contains_login conn
    assert page_contains_sign_up conn
    assert html_response(conn, 200) =~ "Welcome to Local Corral"
  end

  defp page_contains_login(conn) do
    assert html_response(conn, 200) =~ "Login"
  end

  defp page_contains_sign_up(conn) do
    assert html_response(conn, 200) =~ "Sign Up"
  end

end
