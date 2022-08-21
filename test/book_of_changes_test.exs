defmodule BookOfChangesTest do
  use ExUnit.Case
  doctest BookOfChanges

  test "greets the world" do
    assert BookOfChanges.hello() == :world
  end
end
