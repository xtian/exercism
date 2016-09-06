defmodule Bob do
  def hey(input) do
    cond do
      empty?(input) -> "Fine. Be that way!"
      question?(input) -> "Sure."
      shouting?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp empty?(input), do: String.trim(input) == ""
  defp question?(input), do: String.ends_with?(input, "?")

  defp shouting?(input) do
    Regex.match?(~r/\pL+/, input) && String.upcase(input) == input
  end
end
