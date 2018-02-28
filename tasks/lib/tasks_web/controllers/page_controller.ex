defmodule TasksWeb.PageController do
  use TasksWeb, :controller
  alias Tasks.Tracking

  def index(conn, _params) do
    if conn.assigns[:current_user] do
      redirect(conn, to: page_path(conn, :home)) 
    else
      render(conn, "index.html")
    end
  end

  def home(conn, _params) do
    if conn.assigns[:current_user] do
      tasks = Tracking.list_tasks()
      changeset = Tracking.change_task(%Tracking.Task{})
      render(conn, "home.html", tasks: tasks, changeset: changeset)
    else
      redirect(conn, to: page_path(conn, :index))
    end
  end

  def report(conn, _params) do
    if conn.assigns[:current_user] do
      tasks = Tracking.list_employee_tasks(conn.assigns[:current_user])
      changeset = Tracking.change_task(%Tracking.Task{})
      render(conn, "report.html", tasks: tasks, changeset: changeset)
    else
      redirect(conn, to: page_path(conn, :index))
    end
  end
end
