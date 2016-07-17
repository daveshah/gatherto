defmodule Gatherto.PageControllerTest do
  use Gatherto.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "GatherTo"
  end
end
