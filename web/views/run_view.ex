defmodule Gatherto.RunView do
  use Gatherto.Web, :view
  alias Gatherto.Run

  @default_unit "mile"

  def custom_datetime_select(form, field, opts \\ []) do
    builder = fn b ->
    ~e"""
      <div class="form-group"> Date: <%= b.(:month, []) %> / <%= b.(:day, []) %> / <%= b.(:year, []) %> </div>
      <div class="form-group"> Time: <%= b.(:hour, []) %> : <%= b.(:minute, []) %> </div>
    """
    end
    datetime_select(form,
      field, [builder: builder,
              month: [ options: months()],
              minute: [ options: ["00": 00, "15": 15, "45": 45 ] ],
              year: [ options: [ "2017": 2017]]
             ] ++ opts)
  end

  defp months() do
    ["Jan": 01,
     "Feb": 02,
     "Mar": 03,
     "Apr": 04,
     "May": 05,
     "Jun": 06,
     "Jul": 07,
     "Aug": 08,
     "Sep": 09,
     "Oct": 10,
     "Nov": 11,
     "Dec": 12]
  end
end
