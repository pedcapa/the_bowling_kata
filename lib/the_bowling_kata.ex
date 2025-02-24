defmodule TheBowlingKata do
  def score([]), do: 0

  def score([frame | rest]) do
    case frame do
      [10, nil] ->
        bonus = strike_bonus(rest)
        10 + bonus + score(rest)
      [first, second | _] ->
        if first + second == 10 do
          bonus = get_first_roll(rest)
          first + second + bonus + score(rest)
        else
          first + second + score(rest)
        end
    end
  end

  defp strike_bonus(rest) do
    cond do
      rest == [] -> 0
      true ->
        [first | tail] = hd(rest)
        second =
          if length(tail) > 0 do
            hd(tail)
          else
            get_first_roll(tl(rest))
          end
        first + second
    end
  end

  defp get_first_roll([]), do: 0
  defp get_first_roll([next_frame | _]) do
    [first | _] = next_frame
    first
  end
end
