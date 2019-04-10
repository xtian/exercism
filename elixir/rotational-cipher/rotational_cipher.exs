defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """

  @alphabet String.graphemes("abcdefghijklmnopqrstuvwxyz")
  @alphabet_map @alphabet |> Enum.with_index() |> Enum.into(%{})

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.graphemes()
    |> Enum.map_join(fn char ->
      if Regex.match?(~r/[a-zA-Z]/, char) do
        do_rotate(char, shift)
      else
        char
      end
    end)
  end

  defp do_rotate(char, shift) do
    downcased = String.downcase(char)
    index = @alphabet_map |> Map.get(downcased) |> Kernel.+(shift) |> Integer.mod(26)
    rotated = Enum.at(@alphabet, index)

    if char == downcased do
      rotated
    else
      String.upcase(rotated)
    end
  end
end
