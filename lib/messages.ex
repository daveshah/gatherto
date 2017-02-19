defmodule Gatherto.Messages do

  def run_message(run, athlete_numbers) do
    msg = "Run on #{run.time} at #{run.location}"
    athlete_numbers |> Enum.each(&send_message(&1, msg))
  end

  defp send_message(number, message) do
    Task.async( fn ->
    resp  =  ExTwilio.Api.create(ExTwilio.Message,
      [to: number , from: "+12164506425",  body: message])
    end )
  end
end
