defmodule TheBowlingKata do
  def score([]), do: 0
  def score([frame | rest]) do
    [first, second | _] = frame
    first + second + score(rest)
  end
end
