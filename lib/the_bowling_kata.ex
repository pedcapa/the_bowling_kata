defmodule TheBowlingKata do
  def score(game) do
    score(game, 1)
  end

  defp score([], _frame_num), do: 0

  defp score([frame | _], 10) do
    frame |> Enum.filter(&(&1 != nil)) |> Enum.sum()
  end

  defp score([frame | rest], frame_num) when frame_num < 10 do
    cond do
      strike?(frame) ->
        10 + Enum.sum(next_rolls(rest, 2)) + score(rest, frame_num + 1)
      spare?(frame) ->
        10 + (hd(next_rolls(rest, 1)) || 0) + score(rest, frame_num + 1)
      true ->
        (frame |> Enum.filter(&(&1 != nil)) |> Enum.sum()) + score(rest, frame_num + 1)
    end
  end

  defp strike?([10, _]), do: true
  defp strike?(_), do: false

  defp spare?([first, second]) when first + second == 10, do: true
  defp spare?(_), do: false

  defp next_rolls(rest, n) do
    rest
    |> Enum.flat_map(fn frame ->
      Enum.filter(frame, &(&1 != nil))
    end)
    |> Enum.take(n)
  end
end
