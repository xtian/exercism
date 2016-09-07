defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(n) do
    string = Enum.join([
      (if rem(n, 3) == 0, do: "Pling"),
      (if rem(n, 5) == 0, do: "Plang"),
      (if rem(n, 7) == 0, do: "Plong"),
    ])

    if string == "", do: to_string(n), else: string
  end
end
