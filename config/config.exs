use Mix.Config

config :bolt_sips, Bolt,
  url: "bolt://localhost:7687",
  basic_auth: [username: "neo4j", password: "password"],
  pool_size: 10
