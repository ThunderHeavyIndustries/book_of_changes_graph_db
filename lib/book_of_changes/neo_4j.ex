defmodule BookOfChanges.Neo4j do
  alias Bolt.Sips, as: Driver

  def info() do
    Driver.info()
  end

  def conn do
    Driver.conn()
  end

  def query(query_string) do
    conn()
    |> Driver.query!(query_string)
  end
end
