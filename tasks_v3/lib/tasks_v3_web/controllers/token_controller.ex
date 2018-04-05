defmodule TasksV3Web.TokenController do
  use TasksV3Web, :controller
  alias TasksV3.Accounts.User
  alias TasksV3.Accounts

  def create(conn, %{"email" => email, "password" => password}) do
    with {:ok, %User{} = user} <- Accounts.authorize_user(email, password) do
      token = Phoenix.Token.sign(conn, "authorization", user.id)
      put_status(conn, :created)
      |> render("token.json", user: user, token: token)
    end
  end
end
