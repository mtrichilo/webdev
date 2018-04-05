defmodule TasksV3Web.TokenView do
  use TasksV3Web, :view

  def render("token.json", %{user: user, token: token}) do
    %{data: %{token: token, name: user.name}}
  end
end
