defmodule Gatherto.RunViewTest do
  use ExUnit.Case

  alias Gatherto.RunView
  alias Gatherto.Run

  describe "human readable display of distance" do
    test "no distance should be empty string" do
      assert RunView.distance_display(%Run{minimum_distance: nil,
                                           maximum_distance: nil}) == ""
    end

    test "no maximum distance should display the minimum distance" do
      assert RunView.distance_display(%Run{minimum_distance: 1,
                                           maximum_distance: nil}) == "1 mile(s)."
    end

    test "no minimum distance should display the maximum distance" do
      assert RunView.distance_display(%Run{minimum_distance: nil,
                                           maximum_distance: 1}) == "1 mile(s)."
    end

    test "equal distances should only display one" do
      assert RunView.distance_display(%Run{minimum_distance: 1,
                                           maximum_distance: 1}) == "1 mile(s)."
    end

    test "both distances should display the the range" do
      assert RunView.distance_display(%Run{minimum_distance: 1,
                                           maximum_distance: 2}) == "1 to 2 miles."
    end
  end
end
