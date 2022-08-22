defmodule BookOfChanges.Trigram do
  @moduledoc """
    Documentation for `trigram`.
  """
  defstruct yao: "", yao2: "", yao3: ""

  alias __MODULE__

  def yin do
    "--"
  end

  def yang do
    "_"
  end

  def qian do
    %Trigram{yao: yang, yao2: yang, yao3: yang}
  end

  def dui do
    %Trigram{yao: yin, yao2: yang, yao3: yang}
  end

  def li do
    %Trigram{yao: yang, yao2: yin, yao3: yang}
  end

  def zhen do
    %Trigram{yao: yin, yao2: yin, yao3: yang}
  end

  def xun do
    %Trigram{yao: yang, yao2: yang, yao3: yin}
  end

  def kan do
    %Trigram{yao: yin, yao2: yang, yao3: yin}
  end

  def gen do
    %Trigram{yao: yang, yao2: yin, yao3: yin}
  end

  def kun do
    %Trigram{yao: yin, yao2: yin, yao3: yin}
  end
end
