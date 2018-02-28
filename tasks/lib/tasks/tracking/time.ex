defmodule Tasks.Tracking.Time do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasks.Tracking.Time
  alias Tasks.Tracking.Task


  schema "time_blocks" do
    field :end, :naive_datetime
    field :start, :naive_datetime
    belongs_to :task, Task 

    timestamps()
  end

  @doc false
  def changeset(%Time{} = time, attrs) do
    time
    |> cast(attrs, [:task_id, :start, :end])
    |> validate_required([:task_id, :start, :end])
  end
end
