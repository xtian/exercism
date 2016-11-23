defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: { :ok, kind } | { :error, String.t }
  def kind(a, b, c) when a <= 0 or b <= 0 or c <= 0, do: { :error, "all side lengths must be positive" }
  def kind(a, b, c) do
    [a, b, c] = Enum.sort([a, b, c])

    if a + b > c do
      { :ok, classify_triangle(a, b, c) }
    else
      { :error, "side lengths violate triangle inequality" }
    end
  end

  defp classify_triangle(a, a, a), do: :equilateral
  defp classify_triangle(a, a, _), do: :isosceles
  defp classify_triangle(_, a, a), do: :isosceles
  defp classify_triangle(_, _, _), do: :scalene
end
