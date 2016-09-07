module Hamming
  def self.compute(strand_a, strand_b)
    raise ArgumentError unless strand_a.length.eql?(strand_b.length)

    return 0 if strand_a.eql?(strand_b)

    strand_a.chars
      .zip(strand_b.chars)
      .reduce(0) { |acc, (a, b)| acc + (a.eql?(b) ? 0 : 1) }
  end
end

module BookKeeping
  VERSION = 3
end
