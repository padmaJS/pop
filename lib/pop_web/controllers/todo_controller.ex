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

  def show(conn, %{"id" => id}) do
    todo = Todos.get_todo(id)
    render(conn, "show.html", todo: todo)
  end

  def delete(conn, %{"id" => id}) do
    todo = Todos.get_todo(id)
    Todos.delete_todo(todo)
    redirect(conn, to: Routes.todo_path(conn, :index))
  end

  def edit(conn, %{"id" => id}) do
    todo = Todos.get_todo((id))
    changeset = Struct.changeset(%Struct{})
    render(conn, "edit.html", changeset: changeset, todo: todo)
  end

  def update(conn, %{"id" => id, "todo" => updated_task}) do
    todo = Todos.get_todo(id)
    Todos.update_todo(todo, updated_task)
    redirect(conn, to: Routes.todo_path(conn, :index))
  end
end
