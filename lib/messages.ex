defmodule Gatherto.Messages do

  def run_message(run, athlete_numbers) do
    msg = "Run posted for #{run.time} at #{run.location}. Details/RSVP's are here: https://gatherto.herokuapp.com/runs/#{run.id}"
    athlete_numbers |> Enum.each(&send_message(&1, msg))
  end

  defp send_message(number, message) do
    Task.async( fn ->
    resp  =  ExTwilio.Api.create(ExTwilio.Message,
      [to: number , from: "+12164506425",  body: message])
    end )
  end
end
