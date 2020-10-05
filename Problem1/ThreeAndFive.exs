# My first crack
defmodule ThreeAndFive_1 do

  # get multiples of 3 and 5 up to n, inclusive
  def get_multiples(n) do
    1..n
    |> Enum.filter(&(rem(&1, 3) == 0 || rem(&1, 5) == 0))
  end

  def get_sum_of_multiples(n) do
    get_multiples(n)
    |> Enum.reduce(0, fn x, acc -> x + acc end)
  end
  
end


IO.puts ThreeAndFive_1.get_sum_of_multiples(999)
# 233168

# My second crack
defmodule ThreeAndFive_2 do

  def get_sum_of_multiples(n) do
    1..n
    |> Enum.filter(&(rem(&1, 3) == 0 || rem(&1, 5) == 0))
    |> Enum.sum
  end
  
end

IO.puts ThreeAndFive_2.get_sum_of_multiples(999)
# 233168

# Stream works too, when would you use Stream over Enum here?
defmodule ThreeAndFive_3 do

  def get_sum_of_multiples(n) do
    1..n
    |> Stream.filter(&(rem(&1, 3) == 0 || rem(&1, 5) == 0))
    |> Enum.sum
  end
  
end

IO.puts ThreeAndFive_3.get_sum_of_multiples(999)
# 233168


### Other People's Solutions
# https://exercism.io/tracks/elixir/exercises/sum-of-multiples/solutions/5f31ec7218a042c6a4dec7622bf029e1

defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.

  The default factors are 3 and 5.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors \\ [3, 5]) do
    1..(limit - 1)
      |> Stream.filter(&(divisible_by_one_of(&1, factors)))
      |> Enum.sum
  end

  defp divisible_by_one_of(n, factors) do
    Enum.any?(factors, &(rem(n, &1) == 0))
  end
end

IO.puts SumOfMultiples.to(1000)
