defmodule Pop.Todos.Struct do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :title, :string

    timestamps()
  end

  def changeset(todo, attrs \\ %{}) do
    cast(todo, attrs, [:title])
  end
end