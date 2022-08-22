defmodule BookOfChanges.Neo4j do
  alias Bolt.Sips, as: Driver

  def info() do
    Driver.info()
  end

  def conn do
    Driver.conn()
  end

  def raw_query(query_string) do
    conn()
    |> Driver.query!(query_string)
  end

  def results(%Driver.Response{results: results}), do: results

  def query(query_string) do
    query_string
    |> raw_query()
    |> results()
  end
end
