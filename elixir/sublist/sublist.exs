defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, a), do: :equal
  def compare([], _), do: :sublist
  def compare(_, []), do: :superlist
  def compare(a, b) when length(a) == length(b), do: :unequal
  def compare(a, b) when length(a) > length(b) do
    result = compare(b, a)
    if result == :sublist, do: :superlist, else: result
  end

  def compare(a, b) do
    case find_candidate(a, b) do
      nil -> :unequal
      {_, ^a} -> :sublist
      {start, _} ->
        result = compare(a, Enum.drop(b, start + 1))
        if result == :equal, do: :sublist, else: result
    end
  end

  defp find_candidate(a, b) do
    start = Enum.find_index(b, &(&1 == List.first(a)))

    cond do
      start == nil -> nil
      length(b) - start < length(a) -> nil
      true -> {start, Enum.slice(b, start, length(a))}
    end
  end
end
