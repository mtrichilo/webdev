defmodule TasksV3Web.TaskController do
  use TasksV3Web, :controller

  alias TasksV3.Tracking
  alias TasksV3.Tracking.Task

  action_fallback TasksV3Web.FallbackController

  def index(conn, _params) do
    tasks = Tracking.list_tasks()
    render(conn, "index.json", tasks: tasks)
  end

  def create(conn, task_params = %{}) do
    with {:ok, %Task{} = task} <- Tracking.create_task(task_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", task_path(conn, :show, task))
      |> render("show.json", task: task)
    end
  end

  def show(conn, %{"id" => id}) do
    task = Tracking.get_task!(id)
    render(conn, "show.json", task: task)
  end

  def update(conn, task_params = %{"id" => id}) do
    task = Tracking.get_task!(id)

    with {:ok, %Task{} = task} <- Tracking.update_task(task, task_params) do
      render(conn, "show.json", task: task)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = Tracking.get_task!(id)
    with {:ok, %Task{}} <- Tracking.delete_task(task) do
      send_resp(conn, :no_content, "")
    end
  end
end
