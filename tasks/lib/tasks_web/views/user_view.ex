defmodule TasksWeb.UserView do
  use TasksWeb, :view
  alias Tasks.Accounts

  @doc """
  Lists all users by name.

  """
  def list_users() do
    Accounts.list_users_by_name()
  end
end
