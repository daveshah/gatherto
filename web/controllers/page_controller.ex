defmodule Gatherto.PageController do
  use Gatherto.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
