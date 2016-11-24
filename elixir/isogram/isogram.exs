defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    sentence = String.replace(sentence, ~r/[\s-]/, "")
    String.length(sentence) == unique_chars(sentence)
  end

  defp unique_chars(string), do: string |> to_charlist |> Enum.sort |> Enum.dedup |> length
end
