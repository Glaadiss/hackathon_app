# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :hackathon_app,
  ecto_repos: [HackathonApp.Repo]

# Configures the endpoint
config :hackathon_app, HackathonAppWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "3bJUieYLhl/SFSEEFwb9GohZ+k9DZdPIPocE9hTWbwSFql0CMGC49TY466S6LTu5",
  render_errors: [view: HackathonAppWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: HackathonApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]


config :hackathon_app, HackathonApp.Guardian,
  issuer: "hackathon_app",
  secret_key: "4YWaDbj16OL3GkzhTN9WS0MHJPi10kuJRlxjgRt9NbGigIDiNdmOvdzBHWsyQfeC"


config :hackathon_app, HackathonApp.AuthAccessPipeline,
  module:  HackathonApp.Guardian,
  error_handler: HackathonAppWeb.FallbackController

config :arc,
  storage: Arc.Storage.Local

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
