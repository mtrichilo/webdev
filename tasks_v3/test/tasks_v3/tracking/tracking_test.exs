defmodule TasksV3.TrackingTest do
  use TasksV3.DataCase

  alias TasksV3.Tracking

  describe "tasks" do
    alias TasksV3.Tracking.Task

    @valid_attrs %{completed: true, description: "some description", time: 42, title: "some title"}
    @update_attrs %{completed: false, description: "some updated description", time: 43, title: "some updated title"}
    @invalid_attrs %{completed: nil, description: nil, time: nil, title: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tracking.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Tracking.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Tracking.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Tracking.create_task(@valid_attrs)
      assert task.completed == true
      assert task.description == "some description"
      assert task.time == 42
      assert task.title == "some title"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tracking.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, task} = Tracking.update_task(task, @update_attrs)
      assert %Task{} = task
      assert task.completed == false
      assert task.description == "some updated description"
      assert task.time == 43
      assert task.title == "some updated title"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Tracking.update_task(task, @invalid_attrs)
      assert task == Tracking.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Tracking.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Tracking.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Tracking.change_task(task)
    end
  end
end
