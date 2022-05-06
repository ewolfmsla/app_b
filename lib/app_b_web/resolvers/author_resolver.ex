defmodule AppB.AuthorResolver do
  alias AppB.Authors

  def list_authors(_root, _, _) do
    {:ok, Authors.list_authors()}
  end

  def create_author(_root, args, _info) do
    Authors.create_author(args)
  end

  def get_author(_root, args, _info) do
    {:ok, Authors.get_author(args)}
  end

  def get_author_for_link(%{authorId: id}, _args, _info) do
    {:ok, Authors.get_author(id)}
  end
end
