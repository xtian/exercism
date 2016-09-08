class Squares
  def initialize(n)
    @numbers = (1..n).to_a
  end

  def difference
    square_of_sum - sum_of_squares
  end

  def square_of_sum
    @numbers.reduce(0, &:+) ** 2
  end

  def sum_of_squares
    @numbers.reduce(0) { |acc, i| acc + i ** 2 }
  end
end

module BookKeeping; VERSION = 3; end
