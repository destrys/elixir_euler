# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?


# I'm not in love with this, but it works and seems pretty quick.

# Same problem here with focusing on if a number is prime or not.
# And finding the next prime instead of just the next factor
# This is what I used for my submitted answer.

defmodule PrimeFactors do

  def of(n) do
    _of(n, [], [2])
  end

  defp _of(1, current_factors, _), do: current_factors
  defp _of(n, current_factors, known_primes) do
    # find the next prime factor, divide n by that, call of/3
    next_factor =
      known_primes
      |> Enum.filter(&(rem(n, &1) == 0))
      |> Enum.take(1)
      |> List.first

    if next_factor do
      _of(div(n,next_factor), [next_factor|current_factors], known_primes)
    else
      _of(n, current_factors, [next_prime(known_primes, n) | known_primes])
    end
      
  end

  def next_prime(known_primes, max) do
    Enum.max(known_primes)..max
    |> Stream.filter(&is_prime?(&1, known_primes))
    |> Enum.take(1)
    |> List.first
  end

  def is_prime?(n, lower_primes) do
    not_prime =
      lower_primes
      |> Enum.map(&(rem(n, &1) == 0))
      |> Enum.any?
    not not_prime
  end

end


