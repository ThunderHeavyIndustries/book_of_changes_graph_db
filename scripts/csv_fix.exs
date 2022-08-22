defmodule Utils do
  alias BookOfChanges.Trigram



  def convert_to_yao(string) do
    string
    |> String.split("|")
    |> Enum.map(&Integer.parse/1)
    |> Enum.map(fn {i, s} -> i end)
    |> Enum.map(fn i ->
      Trigram.binary_to_yao(i)
    end)
  end

  def get_name(string) do
    string
    |> hd()
    |> String.split(",")
    |> hd()
    |> String.replace("is named ", "")
  end

  def process(row) do
    [yaos|[short_desc|[char|long_desc]]] = row

    yaos = convert_to_yao(yaos)

    name = Utils.get_name(long_desc)

    %{yaos: yaos, name: name, short_desc: short_desc, long_desc: long_desc, character: char}
  end
end

decoded  = File.stream!("scripts/i_ching.csv")
|> CSV.decode
|> Enum.to_list
|> Enum.map(fn {:ok, row} ->

  Utils.process(row)
  |> IO.inspect()
end)
