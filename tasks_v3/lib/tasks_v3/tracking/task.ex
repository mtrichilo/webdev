defmodule TasksV3.Tracking.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias TasksV3.Accounts


  schema "tasks" do
    field :completed, :boolean, default: false
    field :description, :string, null: false
    field :time, :integer, default: 0
    field :title, :string, null: false
    belongs_to :user, TasksV3.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    name = attrs["user_name"]
    unless is_nil(name) do
      change(task, %{user_id: Accounts.get_user_by_name(name).id})
    else
      task
    end
    |> cast(attrs, [:title, :description, :completed, :time, :user_id])
    |> validate_required([:title, :description, :completed, :time, :user_id])
  end
end
