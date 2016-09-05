defmodule Gatherto.ClubControllerTest do
  use Gatherto.ConnCase

  alias Gatherto.Club
  @valid_attrs %{description: "some content", title: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, club_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing clubs"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, club_path(conn, :new)
    assert html_response(conn, 200) =~ "New club"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, club_path(conn, :create), club: @valid_attrs
    assert redirected_to(conn) == club_path(conn, :index)
    assert Repo.get_by(Club, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, club_path(conn, :create), club: @invalid_attrs
    assert html_response(conn, 200) =~ "New club"
  end

  test "shows chosen resource", %{conn: conn} do
    club = Repo.insert! %Club{}
    conn = get conn, club_path(conn, :show, club)
    assert html_response(conn, 200) =~ "Show club"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, club_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    club = Repo.insert! %Club{}
    conn = get conn, club_path(conn, :edit, club)
    assert html_response(conn, 200) =~ "Edit club"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    club = Repo.insert! %Club{}
    conn = put conn, club_path(conn, :update, club), club: @valid_attrs
    assert redirected_to(conn) == club_path(conn, :show, club)
    assert Repo.get_by(Club, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    club = Repo.insert! %Club{}
    conn = put conn, club_path(conn, :update, club), club: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit club"
  end

  test "deletes chosen resource", %{conn: conn} do
    club = Repo.insert! %Club{}
    conn = delete conn, club_path(conn, :delete, club)
    assert redirected_to(conn) == club_path(conn, :index)
    refute Repo.get(Club, club.id)
  end
end
