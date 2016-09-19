defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when count > 0 do
    [2]
    |> Stream.concat(Stream.iterate(3, &(&1 + 2)))
    |> Stream.filter(&prime?/1)
    |> Enum.at(count - 1)
  end

  defp prime?(n) do
    if n <= 7 do
      true
    else
      Stream.iterate(3, &(&1 + 1))
      |> Stream.take_while(&(&1 * &1 <= n))
      |> Enum.any?(&(rem(n, &1) == 0))
      |> Kernel.not()
    end
  end
end
