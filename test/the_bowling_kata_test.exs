defmodule TheBowlingKataTest do
  use ExUnit.Case
  doctest TheBowlingKata

  test "gutter game" do
    game = List.duplicate([0, 0], 9) ++ [[0, 0, nil]]
    assert TheBowlingKata.score(game) == 0
  end

  test "'all ones' game" do
    game = List.duplicate([1, 1], 9) ++ [[1, 1, nil]]
    assert TheBowlingKata.score(game) == 20
  end
end
