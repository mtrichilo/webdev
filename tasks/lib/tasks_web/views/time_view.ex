defmodule TasksWeb.TimeView do
  use TasksWeb, :view
  alias TasksWeb.TimeView

  def render("index.json", %{time_blocks: time_blocks}) do
    %{data: render_many(time_blocks, TimeView, "time.json")}
  end

  def render("show.json", %{time: time}) do
    %{data: render_one(time, TimeView, "time.json")}
  end

  def render("time.json", %{time: time}) do
    %{id: time.id,
      start: time.start,
      end: time.end}
  end
end
