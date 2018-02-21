defmodule TasksWeb.PageController do
  use TasksWeb, :controller

  def index(conn, _params) do
    if conn.assigns[:current_user] do
      redirect(conn, to: page_path(conn, :home)) 
    else
      render(conn, "index.html")
    end
  end

  def home(conn, _params) do
    if conn.assigns[:current_user] do
      tasks = Tasks.Tracking.list_tasks()
      changeset = Tasks.Tracking.change_task(%Tasks.Tracking.Task{})
      render(conn, "home.html", tasks: tasks, changeset: changeset)
    else
      redirect(conn, to: page_path(conn, :index))
    end
  end
end
