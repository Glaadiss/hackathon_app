#     mix run priv/repo/seeds.exs
alias HackathonApp.Accounts
alias HackathonApp.Core
alias HackathonApp.Core.Organization
alias HackathonApp.Core.Award
alias HackathonApp.Accounts.User
alias HackathonApp.Repo

Repo.delete_all(User)
Repo.delete_all(Organization)
Repo.delete_all(Award)

{:ok, account} = Accounts.create_user(%{name: "John", lastname: "Carter", password: "1234", email: "john@gmail.com", status: 0, type: "Kucharz"
  # awards: [ %Award{title: "super ogloszenie", body: "oglaszamcos tam", status: 0, view_count: 10}]
})
{:ok, account2} = Accounts.create_user(%{name: "Mark", lastname: "Carter", password: "1234", email: "mark@gmail.com", status: 1, type: "Murarz"
  # awards: [ %Award{title: "xd ogloszenie", body: "oglaszamcos cos innego :D", status: 0, view_count: 20}]
})
Accounts.create_user(%{name: "Krzysiek", lastname: "Kowalski", password: "123", email: "krzych@gmail.com", status: 1, type: "Tynkarz"
  # awards: [ %Award{title: "wylaczone", body: "off", status: 1, view_count: 40}]
})


Core.create_organization(%{name: "Opel", type: "something type", nip: "321312312"})
Core.create_organization(%{name: "Fiat", type: "cars type", nip: "5133213213"})

Core.create_award(%{topic: "super ogloszenie", subject: "super ogloszenie", body: "oglaszamcos tam", state: 0, view_count: 10, user_id: account.id})
Core.create_award(%{topic: "Oglaszenie", subject: "lorem ipsum dsadsa", body: "dsadsadsadas", state: 0, view_count: 15, user_id: account2.id})

