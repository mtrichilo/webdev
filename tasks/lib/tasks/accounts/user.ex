defmodule Tasks.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Tasks.Accounts
  alias Tasks.Accounts.User


  schema "users" do
    field :email, :string
    field :name, :string
    belongs_to :manager, User
    has_many :employees, User, foreign_key: :manager_id

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    name = attrs["manager_name"]
    unless is_nil(name) do
      change(user, %{manager_id: Accounts.get_user_by_name(name).id})
    else
      user
    end

    |> cast(attrs, [:email, :name, :manager_id])
    |> validate_required([:email, :name])
  end
end
