defmodule Gatherto.ViewHelpers do
  def logged_in?(conn), do: Guardian.Plug.authenticated?(conn)
end
