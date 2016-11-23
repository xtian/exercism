defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.replace(~r/[^\s\w-_]/u, "")
    |> String.split(~r/[\s_]+/u)
    |> Enum.reduce(%{}, fn x, acc ->
      Map.update(acc, x, 1, &(&1 + 1))
    end)
  end
end
