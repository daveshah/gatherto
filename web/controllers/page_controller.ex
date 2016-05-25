defmodule LocalCorral.PageController do
  use LocalCorral.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
