defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count([]), do: 0
  def count([h|t]), do: 1 + count(t)

 ######################################

  @spec reverse(list) :: list
  def reverse([]), do: []
  def reverse(list),  do: do_reverse(list, [])
  defp do_reverse([], acc), do: acc 
  defp do_reverse([h|t], acc), do: do_reverse(t, [h | acc])

 ######################################

  @spec map(list, (any -> any)) :: list
  def map([], _func), do: []
  def map([h|t], func), do: [func.(h) | map(t, func)]

 ######################################

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _func), do: []

  def filter([h|t], func) do
    case func.(h) do
      true -> [h | filter(t, func)]
      false -> filter(t, func)
    end 
  end

 ######################################

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _func), do: acc

  def reduce([h|t], acc, func) do
    acc = func.(h, acc)

    reduce(t, acc, func)
  end

 ######################################

  @spec append(list, list) :: list
  def append([], []), do: []
  def append([], [h|t]), do: [h | append([], t)]
  def append([h|t], list), do: [h | append(t, list)]

 ######################################

  @spec concat([[any]]) :: [any]
  def concat(list) do
  end
end
