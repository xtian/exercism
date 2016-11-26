defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(a, b) when length(a) != length(b), do: {:error, "Lists must be the same length"}
  def hamming_distance(a, b), do: {:ok, calculate_distance(a, b)}

  defp calculate_distance(a, b, acc \\ 0)
  defp calculate_distance([], [], acc), do: acc
  defp calculate_distance([a | tail_a], [a | tail_b], acc), do: calculate_distance(tail_a, tail_b, acc)
  defp calculate_distance([a | tail_a], [b | tail_b], acc), do: calculate_distance(tail_a, tail_b, acc + 1)
end
