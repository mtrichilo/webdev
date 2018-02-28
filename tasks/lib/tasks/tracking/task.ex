defmodule Tasks.Tracking.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasks.Accounts
  alias Tasks.Tracking.Task
  alias Tasks.Tracking.Time


  schema "tasks" do
    field :completed, :boolean, default: false
    field :description, :string
    field :title, :string
    belongs_to :user, Tasks.Accounts.User
    has_many :time_blocks, Time, foreign_key: :task_id

    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    name = attrs["user_name"]
    unless is_nil(name) do
      change(task, %{user_id: Accounts.get_user_by_name(name).id})
    else 
      task
    end

    |> cast(attrs, [:title, :description, :completed, :user_id])
    |> validate_required([:title, :description, :completed, :user_id])
  end
end
