defmodule Gatherto.RunControllerTest do
  use Gatherto.ConnCase

  alias Gatherto.Run

  @valid_attrs %{description: "some content",
                 title: "some content",
                 time: %{day: 12, hour: 14, min: 0, month: 8, sec: 0, year: 2018},
                 minimum_distance: 10,
                 maximum_distance: 15}

  @valid_empty_attrs %{description: "some content",
                       title: "some content",
                       time: %{day: 12, hour: 14, min: 0, month: 8, sec: 0, year: 2018},
                       minimum_distance: "",
                       maximum_distance: ""}

  @invalid_attrs %{}

  @tag :skip # NOTE: need to test with auth
  test "lists all entries on index", %{conn: conn} do
    conn = get conn, run_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing runs"
  end

  @tag :skip # NOTE: need to test with auth
  test "renders form for new resources", %{conn: conn} do
    conn = get conn, run_path(conn, :new)
    assert html_response(conn, 200) =~ "New run"
  end

  @tag :skip # NOTE: need to test with auth
  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, run_path(conn, :create), run: @valid_attrs
    assert redirected_to(conn) == run_path(conn, :index)
    assert Repo.get_by(Run, @valid_attrs)
  end

  @tag :skip # NOTE: need to test with auth
  test "creates resource and redirects when data is valid but empty", %{conn: conn} do
    conn = post conn, run_path(conn, :create), run: @valid_empty_attrs
    assert redirected_to(conn) == run_path(conn, :index)
    assert Repo.get_by(Run, Map.drop(@valid_empty_attrs, [:minimum_distance,
                                                          :maximum_distance]))
  end

  @tag :skip # NOTE: need to test with auth
  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, run_path(conn, :create), run: @invalid_attrs
    assert html_response(conn, 200) =~ "New run"
  end

  @tag :skip # NOTE: need to test with auth
  test "shows chosen resource", %{conn: conn} do
    run = Repo.insert! %Run{}
    conn = get conn, run_path(conn, :show, run)
    assert html_response(conn, 200) =~ "Show run"
  end

  @tag :skip # NOTE: need to test with auth
  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, run_path(conn, :show, -1)
    end
  end

  @tag :skip # NOTE: need to test with auth
  test "renders form for editing chosen resource", %{conn: conn} do
    run = Repo.insert! %Run{}
    conn = get conn, run_path(conn, :edit, run)
    assert html_response(conn, 200) =~ "Edit run"
  end

  @tag :skip # NOTE: need to test with auth
  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    run = Repo.insert! %Run{}
    conn = put conn, run_path(conn, :update, run), run: @valid_attrs
    assert redirected_to(conn) == run_path(conn, :show, run)
    assert Repo.get_by(Run, @valid_attrs)
  end

  @tag :skip # NOTE: need to test with auth
  test "updates chosen resource and redirects when data is valid but empty", %{conn: conn} do
    run = Repo.insert! %Run{}
    conn = put conn, run_path(conn, :update, run), run: @valid_empty_attrs
    assert redirected_to(conn) == run_path(conn, :show, run)
    assert Repo.get_by(Run, Map.drop(@valid_empty_attrs, [:minimum_distance,
                                                          :maximum_distance]))
  end

  @tag :skip # NOTE: need to test with auth
  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    run = Repo.insert! %Run{}
    conn = put conn, run_path(conn, :update, run), run: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit run"
  end

  @tag :skip # NOTE: need to test with auth
  test "deletes chosen resource", %{conn: conn} do
    run = Repo.insert! %Run{}
    conn = delete conn, run_path(conn, :delete, run)
    assert redirected_to(conn) == run_path(conn, :index)
    refute Repo.get(Run, run.id)
  end
end
