# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :sumo_shop,
  ecto_repos: [SumoShop.Repo]

# Configures the endpoint
config :sumo_shop, SumoShopWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "d6StXXlDnbJQft4PvxUSDTeE0mbCVWytCMezlsr6CIZ6t48ZFQeFZcdTTg/89/4n",
  render_errors: [view: SumoShopWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SumoShop.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
