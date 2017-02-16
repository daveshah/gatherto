defmodule Gatherto.DatesTest do
  use ExUnit.Case, async: true
  alias Gatherto.Dates

  describe "date_time/1" do
    test "time and dates broken up" do
      input = %{ "date" => "2017-08-12",
                 "time" => "07:00",
                 "foo" => "bar" }
      assert Dates.date_time(input, "time") == %{ "time" => "2017-08-12 07:00:00",
                                                  "foo"  => "bar" }
    end

    test "the default case" do
      input = %{"foo" => "bar" }
      assert Dates.date_time(input, "time") == %{ "foo"  => "bar" }
    end
  end
end
