# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :tasks_v3,
  ecto_repos: [TasksV3.Repo]

# Configures the endpoint
config :tasks_v3, TasksV3Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PR+xWselSOixj80tlnRNrzNNZwzlTF08pFb8hBCdPXNOcNkOcjKz0JyVOvb58o3f",
  render_errors: [view: TasksV3Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TasksV3.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
