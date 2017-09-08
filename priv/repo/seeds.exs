# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     HackathonApp.Repo.insert!(%HackathonApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# alias HackathonApp.Repo
alias HackathonApp.Accounts
alias HackathonApp.Core
alias HackathonApp.Core.Organization
alias HackathonApp.Accounts.User
alias HackathonApp.Repo


Repo.delete_all(User)
Repo.delete_all(Organization)

Accounts.create_user(%{name: "John", lastname: "Carter", password: "1234", email: "john@gmail.com", status: 0, type: "Kucharz"})
Accounts.create_user(%{name: "Mark", lastname: "Carter", password: "1234", email: "mark@gmail.com", status: 1, type: "Murarz"})
Accounts.create_user(%{name: "Krzysiek", lastname: "Kowalski", password: "123", email: "krzych@gmail.com", status: 1, type: "Tynkarz"})

Core.create_organization(%{name: "Opel", type: "something type", nip: "321312312"})
Core.create_organization(%{name: "Fiat", type: "cars type", nip: "5133213213"})

