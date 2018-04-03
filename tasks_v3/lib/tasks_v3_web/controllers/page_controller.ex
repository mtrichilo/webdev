defmodule TasksV3Web.PageController do
  use TasksV3Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
