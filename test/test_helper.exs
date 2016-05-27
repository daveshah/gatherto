ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Rnnr.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Rnnr.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Rnnr.Repo)

