defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    sorted_base = to_sorted_charlist(base)

    Enum.filter candidates, fn candidate ->
      String.upcase(candidate) != String.upcase(base) &&
      to_sorted_charlist(candidate) == sorted_base
    end
  end

  @spec to_sorted_charlist(String.t) :: charlist()
  defp to_sorted_charlist(string) do
    string
    |> String.upcase()
    |> to_charlist()
    |> Enum.sort()
  end
end
