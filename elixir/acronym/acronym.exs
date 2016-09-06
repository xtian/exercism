defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.replace(~r/[a-z]([A-Z])/, " \\1") # Separate camel-cased words
    |> String.split(~r/\W+/)
    |> Enum.map(&(String.at(String.capitalize(&1), 0)))
    |> List.to_string()
  end
end
