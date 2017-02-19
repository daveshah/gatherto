defmodule Gatherto.AthleteControllerTest do
  use Gatherto.ConnCase

  alias Gatherto.Athlete
  @valid_attrs %{phone: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, athlete_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing athletes"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, athlete_path(conn, :new)
    assert html_response(conn, 200) =~ "New athlete"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, athlete_path(conn, :create), athlete: @valid_attrs
    assert redirected_to(conn) == athlete_path(conn, :index)
    assert Repo.get_by(Athlete, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, athlete_path(conn, :create), athlete: @invalid_attrs
    assert html_response(conn, 200) =~ "New athlete"
  end

  test "shows chosen resource", %{conn: conn} do
    athlete = Repo.insert! %Athlete{}
    conn = get conn, athlete_path(conn, :show, athlete)
    assert html_response(conn, 200) =~ "Show athlete"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, athlete_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    athlete = Repo.insert! %Athlete{}
    conn = get conn, athlete_path(conn, :edit, athlete)
    assert html_response(conn, 200) =~ "Edit athlete"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    athlete = Repo.insert! %Athlete{}
    conn = put conn, athlete_path(conn, :update, athlete), athlete: @valid_attrs
    assert redirected_to(conn) == athlete_path(conn, :show, athlete)
    assert Repo.get_by(Athlete, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    athlete = Repo.insert! %Athlete{}
    conn = put conn, athlete_path(conn, :update, athlete), athlete: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit athlete"
  end

  test "deletes chosen resource", %{conn: conn} do
    athlete = Repo.insert! %Athlete{}
    conn = delete conn, athlete_path(conn, :delete, athlete)
    assert redirected_to(conn) == athlete_path(conn, :index)
    refute Repo.get(Athlete, athlete.id)
  end
end
