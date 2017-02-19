defmodule Gatherto.AthleteController do
  use Gatherto.Web, :controller

  alias Gatherto.Athlete

  def index(conn, _params) do
    athletes = Repo.all(Athlete)
    render(conn, "index.html", athletes: athletes)
  end

  def new(conn, _params) do
    changeset = Athlete.changeset(%Athlete{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"athlete" => athlete_params}) do
    changeset = Athlete.changeset(%Athlete{}, athlete_params)

    case Repo.insert(changeset) do
      {:ok, _athlete} ->
        conn
        |> put_flash(:info, "Athlete created successfully.")
        |> redirect(to: athlete_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    athlete = Repo.get!(Athlete, id)
    render(conn, "show.html", athlete: athlete)
  end

  def edit(conn, %{"id" => id}) do
    athlete = Repo.get!(Athlete, id)
    changeset = Athlete.changeset(athlete)
    render(conn, "edit.html", athlete: athlete, changeset: changeset)
  end

  def update(conn, %{"id" => id, "athlete" => athlete_params}) do
    athlete = Repo.get!(Athlete, id)
    changeset = Athlete.changeset(athlete, athlete_params)

    case Repo.update(changeset) do
      {:ok, athlete} ->
        conn
        |> put_flash(:info, "Athlete updated successfully.")
        |> redirect(to: athlete_path(conn, :show, athlete))
      {:error, changeset} ->
        render(conn, "edit.html", athlete: athlete, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    athlete = Repo.get!(Athlete, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(athlete)

    conn
    |> put_flash(:info, "Athlete deleted successfully.")
    |> redirect(to: athlete_path(conn, :index))
  end
end
