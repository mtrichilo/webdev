defmodule Tasks.TrackingTest do
  use Tasks.DataCase

  alias Tasks.Tracking

  describe "tasks" do
    alias Tasks.Tracking.Task

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

  describe "time_blocks" do
    alias Tasks.Tracking.Time

    @valid_attrs %{end: ~N[2010-04-17 14:00:00.000000], start: ~N[2010-04-17 14:00:00.000000]}
    @update_attrs %{end: ~N[2011-05-18 15:01:01.000000], start: ~N[2011-05-18 15:01:01.000000]}
    @invalid_attrs %{end: nil, start: nil}

    def time_fixture(attrs \\ %{}) do
      {:ok, time} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tracking.create_time()

      time
    end

    test "list_time_blocks/0 returns all time_blocks" do
      time = time_fixture()
      assert Tracking.list_time_blocks() == [time]
    end

    test "get_time!/1 returns the time with given id" do
      time = time_fixture()
      assert Tracking.get_time!(time.id) == time
    end

    test "create_time/1 with valid data creates a time" do
      assert {:ok, %Time{} = time} = Tracking.create_time(@valid_attrs)
      assert time.end == ~N[2010-04-17 14:00:00.000000]
      assert time.start == ~N[2010-04-17 14:00:00.000000]
    end

    test "create_time/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tracking.create_time(@invalid_attrs)
    end

    test "update_time/2 with valid data updates the time" do
      time = time_fixture()
      assert {:ok, time} = Tracking.update_time(time, @update_attrs)
      assert %Time{} = time
      assert time.end == ~N[2011-05-18 15:01:01.000000]
      assert time.start == ~N[2011-05-18 15:01:01.000000]
    end

    test "update_time/2 with invalid data returns error changeset" do
      time = time_fixture()
      assert {:error, %Ecto.Changeset{}} = Tracking.update_time(time, @invalid_attrs)
      assert time == Tracking.get_time!(time.id)
    end

    test "delete_time/1 deletes the time" do
      time = time_fixture()
      assert {:ok, %Time{}} = Tracking.delete_time(time)
      assert_raise Ecto.NoResultsError, fn -> Tracking.get_time!(time.id) end
    end

    test "change_time/1 returns a time changeset" do
      time = time_fixture()
      assert %Ecto.Changeset{} = Tracking.change_time(time)
    end
  end
end
