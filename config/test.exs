import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :moon_river_rocky_grooming, MoonRiverRockyGrooming.Repo,
  username: "postgres",
  password: "postgres",
  database: "moon_river_rocky_grooming_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :moon_river_rocky_grooming_web, MoonRiverRockyGroomingWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "tYt6Tgq831bl3f0+uZ2ckz7rAoxOTma8oEkQzaE5MfngPDa0IcnzMt9lWLlUTeOf",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# In test we don't send emails.
config :moon_river_rocky_grooming, MoonRiverRockyGrooming.Mailer, adapter: Swoosh.Adapters.Test

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
