# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TasksV3.Repo.insert!(%TasksV3.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule Seeds do
  alias TasksV3.Repo
  alias TasksV3.Accounts.User
  alias TasksV3.Tracking.Task

  def run do
    p = Comeonin.Argon2.hashpwsalt("password")

    Repo.delete_all(User)
    m = Repo.insert!(%User{ name: "Michael Trichilo", email: "m@trich.ilo", password_hash: p })

    Repo.delete_all(Task)
    Repo.insert!(%Task{ title: "First Task", description: "Finish this site!", user: m })
  end
end

Seeds.run
