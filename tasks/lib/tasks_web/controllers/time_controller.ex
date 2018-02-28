defmodule TasksWeb.TimeController do
  use TasksWeb, :controller

  alias Tasks.Tracking
  alias Tasks.Tracking.Time

  action_fallback TasksWeb.FallbackController

  def index(conn, _params) do
    time_blocks = Tracking.list_time_blocks()
    render(conn, "index.json", time_blocks: time_blocks)
  end

  def create(conn, %{"time" => time_params}) do
    with {:ok, %Time{} = time} <- Tracking.create_time(time_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", time_path(conn, :show, time))
      |> render("show.json", time: time)
    end
  end

  def show(conn, %{"id" => id}) do
    time = Tracking.get_time!(id)
    render(conn, "show.json", time: time)
  end

  def update(conn, %{"id" => id, "time" => time_params}) do
    time = Tracking.get_time!(id)

    with {:ok, %Time{} = time} <- Tracking.update_time(time, time_params) do
      render(conn, "show.json", time: time)
    end
  end

  def delete(conn, %{"id" => id}) do
    time = Tracking.get_time!(id)
    with {:ok, %Time{}} <- Tracking.delete_time(time) do
      send_resp(conn, :no_content, "")
    end
  end
end
