# TODO  This should provide the seed script to fill Neo4j with all the hexagrams
alias BookOfChanges.{Trigram, Neo4j}

IO.inspect("************** STARTING SEED OF NEO4J *************************")
IO.inspect("Deleting all old content")

"""
  MATCH (n)
  DETACH DELETE n
"""
|> Neo4j.raw_query()

IO.inspect("DONE Deleting old content")
IO.inspect("Adding yin/yang base pair")

"""
  CREATE (Yin:YinYang {name: "yin", visual: "--" })
  CREATE (Yang:YinYang {name: "yang", visual: "_" })
"""
|> Neo4j.raw_query()

IO.inspect("DONE Adding yin yang")
IO.inspect("Adding Base Trigrams")

trigrams = [
  Trigram.qian(),
  Trigram.dui(),
  Trigram.li(),
  Trigram.zhen(),
  Trigram.xun(),
  Trigram.kan(),
  Trigram.gen(),
  Trigram.kun()
]

trigrams
|> Enum.each(fn %Trigram{name: name, yao1: y, yao2: y2, yao3: y3} ->
  """
    MATCH(y1:YinYang {visual: '#{y}'})
    MATCH(y2:YinYang {visual: '#{y2}'})
    MATCH(y3:YinYang {visual: '#{y3}'})

    CREATE (#{name}:Trigram {name: '#{name}'})
    CREATE (#{name})-[:yao1]->(y1)
    CREATE (#{name})-[:yao2]->(y2)
    CREATE (#{name})-[:yao3]->(y3)
  """
  |> Neo4j.raw_query()
end)

IO.inspect("DONE Adding Trigrams")
IO.inspect("Adding Hexagrams")

trigrams
|> Enum.each(fn tri ->
  Enum.each(trigrams, fn tri2 ->
    """
      MATCH (t1:Trigram {name: '#{tri.name}'})
      MATCH (t2:Trigram {name: '#{tri2.name}'})

      MERGE (t1)<-[:top]-(hx: Hexagram {name: 'TBD'})-[:bottom]->(t2)
    """
    |> Neo4j.raw_query()
  end)
end)

IO.inspect("DONE Adding Hexagrams")
IO.inspect("FINISHED")
