defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    validate_nucleotide!(nucleotide)

    strand
    |> Enum.map(&validate_nucleotide!/1)
    |> Enum.filter(&(&1 == nucleotide))
    |> Enum.count()
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    output = Map.new(@nucleotides, &({&1, 0}))

    try do
      Enum.reduce strand, output, fn x, acc ->
        Map.update!(acc, x, &(&1 + 1))
      end
    rescue
      KeyError -> raise ArgumentError
    end
  end

  @spec validate_nucleotide!(char) :: boolean
  defp validate_nucleotide!(nucleotide) do
    unless Enum.member?(@nucleotides, nucleotide), do: raise ArgumentError
    nucleotide
  end
end
