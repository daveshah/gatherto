ExUnit.start

Mix.Task.run "ecto.create", ~w(-r LocalCorral.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r LocalCorral.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(LocalCorral.Repo)

