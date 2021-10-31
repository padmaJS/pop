defmodule Pop.Todos do
  alias Pop.Repo
  alias Pop.Todos.Struct

  def get_todo(id) do
    Repo.get(Struct,id)
  end

  def list_todos do
    Repo.all(Struct)
  end

  def create_todo(attrs \\%{}) do
    %Struct{}
    |> Struct.changeset(attrs)
    |> Repo.insert()
  end

  def delete_todo(id) do
    Repo.delete(get_todo(id))
  end

  def update_todo(id, params) do
    changeset = Ecto.Changeset.change(get_todo(id), title: params)
    Repo.update(changeset)
  end
end
