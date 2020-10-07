# adapted from https://gist.github.com/davidbegin/4246eced3086c09d0a6b

# So we don't need to find *all* the factors, the 

# Damn, this is way fast and way simple.
# With some refactoring, this is super clean.

defmodule Problem3 do

  def max_prime_factor(composite) do
    remove_factor(composite, 2)
  end

  defp remove_factor(1, divisor), do: divisor

  defp remove_factor(composite, divisor) when rem(composite, divisor) == 0 do
    remove_factor(div(composite, divisor), divisor)
  end

  defp remove_factor(composite, divisor) do
    remove_factor(composite, divisor + 1)
  end


end

IO.puts Problem3.max_prime_factor(600851475143)
IO.puts Problem3.max_prime_factor(35461)
