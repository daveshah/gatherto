defmodule Gatherto.ClubView do
  use Gatherto.Web, :view

  def google_maps_api do
    api_key = System.get_env("GOOGLE_MAPS_API_KEY")
    "https://maps.googleapis.com/maps/api/js?key=#{api_key}&libraries=places&callback=initMap"
  end
end
