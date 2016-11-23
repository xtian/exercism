defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(string) do
    try do
      string |> to_charlist |> Enum.reduce([], &process_symbol/2) == []
    rescue
      FunctionClauseError -> nil
    end
  end

  @spec process_symbol(char, [:atom]) :: [:atom]
  defp process_symbol(?{, open), do: [:brace | open]
  defp process_symbol(?[, open), do: [:bracket | open]
  defp process_symbol(?(, open), do: [:paren | open]
  defp process_symbol(?}, [:brace | open]), do: open
  defp process_symbol(?], [:bracket | open]), do: open
  defp process_symbol(?), [:paren | open]), do: open
  defp process_symbol(char, open) when not char in '{}[]()', do: open
end
