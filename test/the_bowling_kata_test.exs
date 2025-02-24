defmodule TheBowlingKataTest do
  use ExUnit.Case
  doctest TheBowlingKata

  test "gutter game" do
    game = List.duplicate([0, 0], 9) ++ [[0, 0, nil]]
    assert TheBowlingKata.score(game) == 0
  end
end
