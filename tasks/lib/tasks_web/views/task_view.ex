defmodule TasksWeb.TaskView do
  use TasksWeb, :view

  @doc """
  Lists all employees by name.

  """
  def list_employees(user) do
    if is_nil(user) do
      []
    else
      Enum.map(user.employees, &(&1.name)) ++ [user.name]
      |> Enum.uniq
    end
  end
end
