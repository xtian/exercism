defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(word) do
    word
    |> String.upcase
    |> to_charlist
    |> Enum.reduce(0, &(letter_score(&1) + &2))
  end

  @spec letter_score(char) :: non_neg_integer
  defp letter_score(l) do
    cond do
      l in 'AEIOULNRST' -> 1
      l in 'DG'         -> 2
      l in 'BCMP'       -> 3
      l in 'FHVWY'      -> 4
      l in 'K'          -> 5
      l in 'JX'         -> 8
      l in 'QZ'         -> 10
      true              -> 0
    end
  end
end
