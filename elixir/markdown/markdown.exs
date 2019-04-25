defmodule Markdown do
  @doc """
  Parses a given string with Markdown syntax and returns the associated HTML for that string.

  ## Examples

  iex> Markdown.parse("This is a paragraph")
  "<p>This is a paragraph</p>"

  iex> Markdown.parse("#Header!\n* __Bold Item__\n* _Italic Item_")
  "<h1>Header!</h1><ul><li><em>Bold Item</em></li><li><i>Italic Item</i></li></ul>"
  """

  @spec parse(String.t()) :: String.t()
  def parse(markdown) do
    markdown
    |> String.split("\n")
    |> Enum.map(&parse_line/1)
    |> Enum.join()
    |> wrap_list_items_in_unordered_list()
  end

  defp parse_line(line) do
    cond do
      String.starts_with?(line, "#") ->
        line |> parse_header_level() |> enclose_with_header_tag()

      String.starts_with?(line, "*") ->
        parse_list_item(line)

      true ->
        line |> String.split() |> enclose_with_paragraph_tag()
    end
  end

  defp parse_header_level(line) do
    [head | tail] = String.split(line)
    {String.length(head), Enum.join(tail, " ")}
  end

  defp parse_list_item(line) do
    words = line |> String.trim_leading("* ") |> String.split()
    "<li>#{join_words_with_tags(words)}</li>"
  end

  defp enclose_with_header_tag({level, contents}) do
    "<h#{level}>#{contents}</h#{level}>"
  end

  defp enclose_with_paragraph_tag(words) do
    "<p>#{join_words_with_tags(words)}</p>"
  end

  defp join_words_with_tags(words) do
    words
    |> Enum.map(&replace_md_with_tag/1)
    |> Enum.join(" ")
  end

  defp replace_md_with_tag(word) do
    word |> replace_prefix_md() |> replace_suffix_md()
  end

  defp replace_prefix_md(string) do
    cond do
      string =~ ~r/^__{1}/ -> String.replace(string, ~r/^__{1}/, "<strong>", global: false)
      string =~ ~r/^[_{1}][^_+]/ -> String.replace(string, ~r/_/, "<em>", global: false)
      true -> string
    end
  end

  defp replace_suffix_md(string) do
    cond do
      string =~ ~r/__{1}$/ -> String.replace(string, ~r/__{1}$/, "</strong>")
      string =~ ~r/[^_{1}]/ -> String.replace(string, ~r/_/, "</em>")
      true -> string
    end
  end

  defp wrap_list_items_in_unordered_list(html) do
    html
    |> String.replace("<li>", "<ul><li>", global: false)
    |> String.replace_suffix("</li>", "</li></ul>")
  end
end
