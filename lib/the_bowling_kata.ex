defmodule TheBowlingKata do
  def score([]), do: 0

  def score([frame | rest]) do
    [first, second | _] = frame

    if first + second == 10 and first != 10 do
      bonus = get_first_roll(rest)
      first + second + bonus + score(rest)
    else
      first + second + score(rest)
    end
  end

  defp get_first_roll([]), do: 0
  defp get_first_roll([next_frame | _]) do
    [first | _] = next_frame
    first
  end
end
