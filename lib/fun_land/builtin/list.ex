defmodule FunLand.Builtin.List do


  use CombinableMonad

  def map(list, function) do
    :lists.map(function, list)
  end

  # This implementation of `ap` is returning all possible solutions of combining the function(s) in `a` with the elements of `b`, AKA the cartesion product.
  def apply_with([], b) when is_list(b), do: []
  def apply_with([h | t], b) when is_list(b) and is_function(h) do
    partial_results = for elem <- b do
      h.(b)
    end
    partial_results ++ apply_with(t, b)
  end

end