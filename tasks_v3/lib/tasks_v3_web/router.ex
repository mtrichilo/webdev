defmodule TasksV3Web.Router do
  use TasksV3Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TasksV3Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/login", PageController, :index
    get "/register", PageController, :index
    get "/tasks", PageController, :index
    get "/new", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api/v3", TasksV3Web do
    pipe_through :api
    post "/token", TokenController, :create
    resources "/user", UserController, except: [:new, :edit]
    resources "/tasks", TaskController, except: [:new, :edit]
  end
end
