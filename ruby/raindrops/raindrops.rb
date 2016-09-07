module Raindrops
  def self.convert(num)
    output = [
      ("Pling" if num % 3 == 0),
      ("Plang" if num % 5 == 0),
      ("Plong" if num % 7 == 0)
    ].join

    output.empty? ? num.to_s : output
  end
end

module BookKeeping; VERSION = 2; end
