defmodule Tasks.Tracking do
  @moduledoc """
  The Tracking context.
  """

  import Ecto.Query, warn: false
  alias Tasks.Repo

  alias Tasks.Tracking.Task

  @doc """
  Returns the list of tasks.

  ## Examples

      iex> list_tasks()
      [%Task{}, ...]

  """
  def list_tasks do
    Repo.all(Task)
    |> Repo.preload(:user)
  end

  @doc """
  Returns the list of employee tasks.

  """
  def list_employee_tasks(user) do
    ids = Enum.map(user.employees, &(&1.id))
    Repo.all(from t in Task, where: t.user_id in ^ids)
    |> Repo.preload(:user)
  end

  @doc """
  Gets a single task.

  Raises `Ecto.NoResultsError` if the Task does not exist.

  ## Examples

      iex> get_task!(123)
      %Task{}

      iex> get_task!(456)
      ** (Ecto.NoResultsError)

  """
  def get_task!(id) do 
    Repo.get!(Task, id)
    |> Repo.preload(:user)
  end

  @doc """
  Creates a task.

  ## Examples

      iex> create_task(%{field: value})
      {:ok, %Task{}}

      iex> create_task(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_task(attrs \\ %{}) do
    %Task{}
    |> Task.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a task.

  ## Examples

      iex> update_task(task, %{field: new_value})
      {:ok, %Task{}}

      iex> update_task(task, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_task(%Task{} = task, attrs) do
    task
    |> Task.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Task.

  ## Examples

      iex> delete_task(task)
      {:ok, %Task{}}

      iex> delete_task(task)
      {:error, %Ecto.Changeset{}}

  """
  def delete_task(%Task{} = task) do
    Repo.delete(task)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking task changes.

  ## Examples

      iex> change_task(task)
      %Ecto.Changeset{source: %Task{}}

  """
  def change_task(%Task{} = task) do
    Task.changeset(task, %{})
  end

  alias Tasks.Tracking.Time

  @doc """
  Returns the list of time_blocks.

  ## Examples

      iex> list_time_blocks()
      [%Time{}, ...]

  """
  def list_time_blocks do
    Repo.all(Time)
  end

  @doc """
  Gets a single time.

  Raises `Ecto.NoResultsError` if the Time does not exist.

  ## Examples

      iex> get_time!(123)
      %Time{}

      iex> get_time!(456)
      ** (Ecto.NoResultsError)

  """
  def get_time!(id), do: Repo.get!(Time, id)

  @doc """
  Creates a time.

  ## Examples

      iex> create_time(%{field: value})
      {:ok, %Time{}}

      iex> create_time(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_time(attrs \\ %{}) do
    %Time{}
    |> Time.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a time.

  ## Examples

      iex> update_time(time, %{field: new_value})
      {:ok, %Time{}}

      iex> update_time(time, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_time(%Time{} = time, attrs) do
    time
    |> Time.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Time.

  ## Examples

      iex> delete_time(time)
      {:ok, %Time{}}

      iex> delete_time(time)
      {:error, %Ecto.Changeset{}}

  """
  def delete_time(%Time{} = time) do
    Repo.delete(time)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking time changes.

  ## Examples

      iex> change_time(time)
      %Ecto.Changeset{source: %Time{}}

  """
  def change_time(%Time{} = time) do
    Time.changeset(time, %{})
  end
end
