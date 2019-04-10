defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """

  @alphabet_lower ?a..?z
  @alphabet_upper ?A..?Z

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text |> to_charlist() |> Enum.map(&do_rotate(&1, shift)) |> List.to_string()
  end

  defp do_rotate(char, shift) when char in @alphabet_lower do
    Enum.at(@alphabet_lower, Integer.mod(char - ?a + shift, 26))
  end

  defp do_rotate(char, shift) when char in @alphabet_upper do
    Enum.at(@alphabet_upper, Integer.mod(char - ?A + shift, 26))
  end

  defp do_rotate(char, _) do
    char
  end
end
