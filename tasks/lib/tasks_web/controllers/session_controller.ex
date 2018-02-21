defmodule TasksWeb.SessionController do
  use TasksWeb, :controller

  alias Tasks.Accounts 

  @doc """
  Creates a new user session.
  
  """
  def create(conn, %{"email" => email}) do
    user = Accounts.get_user_by_email(email)
    if user do
      put_session(conn, :user_id, user.id)
      |> put_flash(:info, "Welcome, #{user.name}")
      |> redirect(to: page_path(conn, :home))
    else
      put_flash(conn, :error, "Could not find account")
      |> redirect(to: page_path(conn, :index))
    end
  end

  @doc """
  Deletes an existing user session.
  
  """
  def delete(conn, _params) do
    delete_session(conn, :user_id)
    |> redirect(to: page_path(conn, :index))
  end
end
