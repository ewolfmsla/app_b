alias AppB.Content.Author
alias AppB.Repo

%Author{id: 4, first_name: "Eric", last_name: "Wolf"}
|> Repo.insert!()

%Author{id: 5, first_name: "Doruk", last_name: "Gurleyen"}
|> Repo.insert!()
