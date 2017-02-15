defmodule Gatherto.RunControllerTest do
  use Gatherto.ConnCase
  alias Gatherto.Athlete

  alias Gatherto.Run

  @valid_attrs %{title: "some content",
                 time: %{day: 12, hour: 14, min: 0, month: 8, sec: 0, year: 2018},
                 distance: "10 miles",
                 location: "The awesome spot" }

  @valid_empty_attrs %{title: "some content",
                       time: %{day: 12, hour: 14, min: 0, month: 8, sec: 0, year: 2018},
                       location: "The awesome spot",
                       distance: "",
                       pace: ""}

  @invalid_attrs %{}

  setup do
    athlete = Repo.insert! %Athlete{ email: "test@test.com" }
    conn = login(athlete)
    {:ok, %{ conn: conn} }
  end

  def login(user, token \\ :token) do
    build_conn()
    |> bypass_through(Gatherto.Router, [:browser])
    |> get("/")
    |> Guardian.Plug.sign_in(user, token)
    |> send_resp(200, "Session Flushed")
    |> recycle()
  end

  test "lists all entries on index", %{ conn: conn} do
    conn = get conn, run_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing runs"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, run_path(conn, :new)
    assert html_response(conn, 200) =~ "New run"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, run_path(conn, :create), run: @valid_attrs
    assert redirected_to(conn) == run_path(conn, :index)
    assert Repo.get_by(Run, @valid_attrs)
  end

  test "creates resource and redirects when data is valid but empty", %{conn: conn} do
    conn = post conn, run_path(conn, :create), run: @valid_empty_attrs
    assert redirected_to(conn) == run_path(conn, :index)
    assert Repo.get_by(Run, Map.drop(@valid_empty_attrs, [:distance, :pace]))
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, run_path(conn, :create), run: @invalid_attrs
    assert html_response(conn, 200) =~ "New run"
  end

  test "shows chosen resource", %{conn: conn} do
    run = Repo.insert! %Run{}
    conn = get conn, run_path(conn, :show, run)
    assert html_response(conn, 200) =~ "Show run"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, run_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    run = Repo.insert! %Run{}
    conn = get conn, run_path(conn, :edit, run)
    assert html_response(conn, 200) =~ "Edit run"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    run = Repo.insert! %Run{}
    conn = put conn, run_path(conn, :update, run), run: @valid_attrs
    assert redirected_to(conn) == run_path(conn, :show, run)
    assert Repo.get_by(Run, @valid_attrs)
  end

  test "updates chosen resource and redirects when data is valid but empty", %{conn: conn} do
    run = Repo.insert! %Run{}
    conn = put conn, run_path(conn, :update, run), run: @valid_empty_attrs
    assert redirected_to(conn) == run_path(conn, :show, run)
    assert Repo.get_by(Run, Map.drop(@valid_empty_attrs, [:distance, :pace]))
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    run = Repo.insert! %Run{}
    conn = put conn, run_path(conn, :update, run), run: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit run"
  end

  test "deletes chosen resource", %{conn: conn} do
    run = Repo.insert! %Run{}
    conn = delete conn, run_path(conn, :delete, run)
    assert redirected_to(conn) == run_path(conn, :index)
    refute Repo.get(Run, run.id)
  end
end
