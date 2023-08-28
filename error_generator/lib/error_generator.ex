defmodule ErrorGenerator do
  @moduledoc """
  A module to programmatically generate various runtime errors in Elixir.

  This module provides functionality to simulate a variety of common runtime errors:
  - Arithmetic errors (e.g., division by zero)
  - Function clause errors
  - Key errors (missing map keys)
  - Pattern match errors
  - Generic runtime errors
  """

  @doc """
  Generates a specified number of random runtime errors.

  This function will trigger a random error for each integer in the range from 1 to `n`.
  Each error is caught and a corresponding message is printed to the console.

  ## Parameters
  - `n`: The number of errors to generate.

  ## Examples
      iex> ErrorGenerator.generate_errors(5)
      Caught arithmetic error: bad argument in arithmetic expression
      Caught match error: no match of right hand side value: {:error, "Mismatched tuple"}
      ...

  """
  def generate_errors(n) when is_integer(n) and n > 0 do
    1..n
    |> Enum.each(fn i ->
      try do
        simulate_error(Enum.random(1..5))
      rescue
        e in ArithmeticError -> IO.puts("Caught arithmetic error: #{e.message}")
        e in FunctionClauseError -> IO.puts("Caught function clause error: #{e.message}")
        e in KeyError -> IO.puts("Caught key error: #{e.message}")
        e in MatchError -> IO.puts("Caught match error: #{e.message}")
        e in RuntimeError -> IO.puts("Caught runtime error: #{e.message}")
      end
    end)
  end

  defp simulate_error(1), do: 5 / 0
  defp simulate_error(2), do: no_matching_function(:test)
  defp simulate_error(3), do: %{}[:missing_key]
  defp simulate_error(4), do: {:ok, value} = {:error, "Mismatched tuple"}
  defp simulate_error(5), do: raise("A generic runtime error")

  defp no_matching_function(:not_test), do: :ok
end
