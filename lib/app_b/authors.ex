defmodule AppB.Authors do
  @moduledoc false

  import Ecto.Query, warn: false
  alias AppB.Repo

  alias AppB.Content.Author

  def get_author(id) do
    Repo.get_by(Author, id: id)
  end

  def list_authors() do
    Repo.all(Author)
  end

  def create_author(params \\ %{}) do
    %Author{}
    |> Author.changeset(params)
    |> Repo.insert()
  end
end
