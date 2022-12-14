defmodule BookOfChanges.Hexagram do
  @moduledoc """
    Documentation for `Hexagram`.
  """
  alias __MODULE__
  alias BookOfChanges.Trigram
  defstruct name: "", top: %Trigram{}, bottom: %Trigram{}

  def generate(top = %Trigram{}, bottom = %Trigram{}) do
    %Hexagram{top: top, bottom: bottom}
  end

  def get_yao(hexagram = %Hexagram{top: t, bottom: b}) do
    %{yao1: yao1, yao2: yao2, yao3: yao3} = t
    %{yao1: yao4, yao2: yao5, yao3: yao6} = b

    [yao1, yao2, yao3, yao4, yao5, yao6]
  end

  def pp(hexagram = %Hexagram{}) do
    hexagram
    |> get_yao
    |> Enum.each(&IO.inspect/1)
  end
end
