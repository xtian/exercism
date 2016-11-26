defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(list, acc \\ 0)
  def count([], acc), do: acc
  def count([_ | tail], acc), do: count(tail, acc + 1)

  @spec reverse(list) :: list
  def reverse(list, acc \\ [])
  def reverse([], acc), do: acc
  def reverse([head | tail], acc), do: reverse(tail, [head | acc])

  @spec map(list, (any -> any)) :: list
  def map([], _), do: []
  def map([head | tail], f), do: [f.(head) | map(tail, f)]

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _), do: []
  def filter([head | tail], f) do
    tail = filter(tail, f)
    if f.(head), do: [head | tail], else: tail
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _), do: acc
  def reduce([head | tail], acc, f), do: reduce(tail, f.(head, acc), f)

  @spec append(list, list) :: list
  def append([], a), do: a
  def append(a, []), do: a
  def append([head | tail], b), do: [head | append(tail, b)]

  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([a | tail]), do: append(a, concat(tail))
end
