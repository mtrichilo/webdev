defmodule Tasks.Tracking.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasks.Tracking.Task


  schema "tasks" do
    field :completed, :boolean, default: false
    field :description, :string
    field :time, :integer
    field :title, :string
    belongs_to :user, Tasks.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:title, :description, :completed, :user_id, :time])
    |> validate_required([:title, :description, :completed, :user_id, :time])
    |> validate_change(:time, fn :time, time ->
      if Integer.mod(time, 15) != 0 do
        [time: "Time must be in multiples of 15 minutes"]
      else
        []
      end
    end)
  end
end
