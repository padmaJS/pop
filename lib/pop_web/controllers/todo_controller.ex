defmodule PopWeb.TodoController do
  use PopWeb, :controller
  alias Pop.Todos
  alias Pop.Todos.Struct


  def index(conn, _) do
    todos = Todos.list_todos()
    render(conn, "index.html", todos: todos)
  end

  def new(conn, _params) do
    changeset = Struct.changeset(%Struct{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"struct" => todos_params}) do
    Todos.create_todo(todos_params)
    redirect(conn, to: Routes.todo_path(conn, :index))
  end

  # def delete(conn, %{"struct" => %{"id" => todo_params}}) do
  #   Todos.delete_todo(todo_params)

  # end

  def update(conn, %{"id" => id, "title" => task}) do
    Todos.update_todo(id, task)
    redirect(conn, to: Routes.todo_path(conn, :index))
  end
end
