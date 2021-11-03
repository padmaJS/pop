defmodule Pop.Todos.Struct do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :title, :string

    timestamps()
  end

  def changeset(todo, attrs \\ %{}) do
    todo
    |> cast(attrs, [:title])
    |> validate_required([:title])
    |> unique_constraint(:title)
  end
end
