defmodule Rnnr.PageController do
  use Rnnr.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
