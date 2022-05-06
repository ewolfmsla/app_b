defmodule AppB.Schema do
  use Absinthe.Schema
  use Absinthe.Federation.Schema

  alias AppB.AuthorResolver

  query do
    extends()

    field :list_authors, list_of(:author) do
      resolve(&AuthorResolver.list_authors/3)
    end

    field :get_author, :author do
      arg(:id, non_null(:id))
      resolve(&AuthorResolver.get_author/3)
    end
  end

  mutation do
    field :create_author, :author do
      arg(:first_name, non_null(:string))
      arg(:last_name, non_null(:string))
      resolve(&AuthorResolver.create_author/3)
    end
  end

  object :author do
    key_fields("id")
    field(:id, non_null(:id))
    field(:first_name, non_null(:string))
    field(:last_name, non_null(:string))
  end

  object :link do
    key_fields("authorId")
    extends()

    field :author_id, non_null(:id) do
      external()
    end

    field(:author, :author) do
      resolve(&AuthorResolver.get_author_for_link/3)
    end
  end
end
