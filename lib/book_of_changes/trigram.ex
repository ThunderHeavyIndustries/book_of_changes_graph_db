defmodule BookOfChanges.Trigram do
  @moduledoc """
    Documentation for `trigram`.
  """
  defstruct name: "", yao1: "", yao2: "", yao3: ""

  alias __MODULE__

  def yin do
    "--"
  end

  def yang do
    "_"
  end

  def yao_to_binary(yao) do
    case yao do
      "--" -> 0
      "_" -> 1
    end
  end

  def binary_to_yao(binary) do
    case binary do
      0 -> "--"
      1 -> "_"
    end
  end

  def qian do
    %Trigram{name: "qian", yao1: yang(), yao2: yang(), yao3: yang()}
  end

  def dui do
    %Trigram{name: "dui", yao1: yin(), yao2: yang(), yao3: yang()}
  end

  def li do
    %Trigram{name: "li", yao1: yang(), yao2: yin(), yao3: yang()}
  end

  def zhen do
    %Trigram{name: "zhen", yao1: yin(), yao2: yin(), yao3: yang()}
  end

  def xun do
    %Trigram{name: "xun", yao1: yang(), yao2: yang(), yao3: yin()}
  end

  def kan do
    %Trigram{name: "kan", yao1: yin(), yao2: yang(), yao3: yin()}
  end

  def gen do
    %Trigram{name: "gen", yao1: yang(), yao2: yin(), yao3: yin()}
  end

  def kun do
    %Trigram{name: "kun", yao1: yin(), yao2: yin(), yao3: yin()}
  end
end
