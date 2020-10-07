# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?

# This works, but is slow as shit.
# -1

# The problem here is I was stuck on determining if a number was prime.
# As shown in  OtherPrimeFactors.exs, if you focus on shape of the prime factors
# e.g. [2,2,2,5,7,1471,6857]
# you can think about how to just remove the factors from the left and it's MUCH simpler.

defmodule PrimeFactors do

  def of(n) do
    possible_factors =
      :math.sqrt(n)
      |> floor
      |> primes_below
    _of(n, [], possible_factors)
  end

  defp _of(1, current_factors, _), do: current_factors
  defp _of(n, current_factors, possible_factors) do
    # find the next prime factor, divide n by that, call _of/2
    next_factor =
      possible_factors
      |> Stream.filter(&(rem(n, &1) == 0))
      |> Enum.take(1)
      |> List.first

    IO.puts(next_factor)
    
    _of(div(n,next_factor), [next_factor|current_factors], possible_factors)
  end
  

  def primes_below(n) do
    Enum.reverse(_primes_below(n))
  end
  
  defp _primes_below(1), do: []
  defp _primes_below(n) do
    lower_primes = _primes_below(n-1)
    if is_prime?(n, lower_primes) do
      [n | lower_primes]
    else
      lower_primes
    end
  end

  
  def is_prime?(n, lower_primes) do
    # divide by each lower prime
    # are any results integers?
    # if so, true, else false
    not_prime =
      lower_primes
      |> Stream.map(&(rem(n, &1) == 0))
      |> Enum.any?
    not not_prime
  end
  

end
