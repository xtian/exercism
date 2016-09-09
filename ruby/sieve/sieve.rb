class Sieve
  def initialize(n)
    @n = n
  end

  def primes
    filter_non_primes((2..@n).to_a)
  end

  private

  def filter_non_primes(remaining, index = 0)
    factor = remaining[index]
    return remaining if factor.nil?

    multiples = ((factor * 2)..@n).step(factor).to_a
    filter_non_primes(remaining - multiples, index + 1)
  end
end
