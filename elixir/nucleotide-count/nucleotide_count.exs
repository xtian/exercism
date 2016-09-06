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
  def count(_, char) when not char in @nucleotides, do: raise ArgumentError
  def count(strand, nucleotide) do
    validate_strand!(strand)
    Enum.count(strand, &(&1 == nucleotide))
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    validate_strand!(strand)
    output = Map.new(@nucleotides, &({&1, 0}))

    Enum.reduce strand, output, fn x, acc ->
      Map.update!(acc, x, &(&1 + 1))
    end
  end

  defp validate_strand!(strand) do
    Enum.any?(strand, &(not &1 in @nucleotides)) and raise ArgumentError
  end
end
