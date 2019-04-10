defmodule ISBNVerifier do
  @doc """
    Checks if a string is a valid ISBN-10 identifier

    ## Examples

      iex> ISBNVerifier.isbn?("3-598-21507-X")
      true

      iex> ISBNVerifier.isbn?("3-598-2K507-0")
      false

  """
  @spec isbn?(String.t()) :: boolean
  def isbn?(isbn) do
    Regex.run(~r/\A(\d)\-?(\d{3})\-?(\d{5})\-?([\dX])\Z/, isbn) |> do_isbn?()
  end

  defp do_isbn?(nil), do: false

  defp do_isbn?(matches) do
    matches
    |> Stream.drop(1)
    |> Stream.flat_map(&String.graphemes/1)
    |> Stream.map(fn
      "X" -> 10
      n -> String.to_integer(n)
    end)
    |> Stream.zip(10..1)
    |> Enum.reduce(0, fn {value, index}, acc -> acc + value * index end)
    |> Integer.mod(11)
    |> Kernel.==(0)
  end
end
