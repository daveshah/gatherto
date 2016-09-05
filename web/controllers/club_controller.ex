defmodule Gatherto.ClubController do
  use Gatherto.Web, :controller

  alias Gatherto.Club

  def index(conn, _params) do
    clubs = Repo.all(Club)
    render(conn, "index.html", clubs: clubs)
  end

  def new(conn, _params) do
    changeset = Club.changeset(%Club{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"club" => club_params}) do
    changeset = Club.changeset(%Club{}, club_params)

    case Repo.insert(changeset) do
      {:ok, _club} ->
        conn
        |> put_flash(:info, "Club created successfully.")
        |> redirect(to: club_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    club = Repo.get!(Club, id)
    render(conn, "show.html", club: club)
  end

  def edit(conn, %{"id" => id}) do
    club = Repo.get!(Club, id)
    changeset = Club.changeset(club)
    render(conn, "edit.html", club: club, changeset: changeset)
  end

  def update(conn, %{"id" => id, "club" => club_params}) do
    club = Repo.get!(Club, id)
    changeset = Club.changeset(club, club_params)

    case Repo.update(changeset) do
      {:ok, club} ->
        conn
        |> put_flash(:info, "Club updated successfully.")
        |> redirect(to: club_path(conn, :show, club))
      {:error, changeset} ->
        render(conn, "edit.html", club: club, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    club = Repo.get!(Club, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(club)

    conn
    |> put_flash(:info, "Club deleted successfully.")
    |> redirect(to: club_path(conn, :index))
  end
end
