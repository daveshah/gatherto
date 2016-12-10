defmodule Gatherto.RunController do
  use Gatherto.Web, :controller
  alias Gatherto.Run

  plug Guardian.Plug.EnsureAuthenticated
  plug :scrub_params, "run" when action in [:create, :update]

  def index(conn, _params) do
    runs = Repo.all(Run)
    render(conn, "index.html", runs: runs)
  end

  def new(conn, _params) do
    changeset = Run.changeset(%Run{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"run" => run_params}) do
    changeset = Run.changeset(%Run{}, run_params)

    case Repo.insert(changeset) do
      {:ok, _run} ->
        conn
        |> put_flash(:info, "Run created successfully.")
        |> redirect(to: run_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    render(conn, "show.html", run: run(id))
  end

  def edit(conn, %{"id" => id}) do
    run = run(id)
    changeset = Run.changeset(run)
    render(conn, "edit.html", run: run, changeset: changeset)
  end

  def update(conn, %{"id" => id, "run" => run_params}) do
    run = run(id)
    changeset = Run.changeset(run, run_params)

    case Repo.update(changeset) do
      {:ok, run} ->
        conn
        |> put_flash(:info, "Run updated successfully.")
        |> redirect(to: run_path(conn, :show, run))
      {:error, changeset} ->
        render(conn, "edit.html", run: run, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    id |> run() |> Repo.delete!()
    conn
    |> put_flash(:info, "Run deleted successfully.")
    |> redirect(to: run_path(conn, :index))
  end

  defp run(id) do
    Repo.get!(Run, id)
  end
end
