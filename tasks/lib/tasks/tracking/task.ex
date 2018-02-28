defmodule Tasks.Tracking.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasks.Accounts
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
    name = attrs["user_name"]
    unless is_nil(name) do
      change(task, %{user_id: Accounts.get_user_by_name(name).id})
    else 
      task
    end

    |> cast(attrs, [:title, :description, :completed, :user_id, :time])
    |> validate_required([:title, :description, :completed, :user_id, :time])
  end
end
