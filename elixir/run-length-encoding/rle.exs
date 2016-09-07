defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(""), do: ""
  def encode(string) do
    string
    |> String.codepoints()
    |> Enum.reduce([], &accumulate_runs/2)
    |> Enum.reduce("", fn {c, count}, acc -> "#{count}#{c}#{acc}" end)
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r/(\d+)(\w)/, string)
    |> Enum.map(fn [_, count, c] -> expand_run(count, c) end)
    |> Enum.join()
  end

  defp accumulate_runs(c, []), do: [{c, 1}]
  defp accumulate_runs(c, [{c, count} | tail]), do: [{c, count + 1}] ++ tail
  defp accumulate_runs(c, acc), do: [{c, 1}] ++ acc

  defp expand_run(count, c), do: String.duplicate(c, String.to_integer(count))
end
