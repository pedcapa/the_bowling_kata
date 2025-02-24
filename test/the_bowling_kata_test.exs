defmodule TheBowlingKataTest do
  use ExUnit.Case
  doctest TheBowlingKata

  test "greets the world" do
    assert TheBowlingKata.hello() == :world
  end
end
