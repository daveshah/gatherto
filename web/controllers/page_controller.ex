defmodule Gatherto.PageController do
  use Gatherto.Web, :controller
  alias Gatherto.Run

  def index(conn, _params) do
    runs = Repo.all Run
    render conn, "index.html", runs: runs
  end
end
