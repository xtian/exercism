module Pangram
  ALPHABET = ('a'..'z').to_a.freeze

  def self.is_pangram?(string)
    string.downcase.chars.sort.uniq & ALPHABET == ALPHABET
  end
end

module BookKeeping; VERSION = 2; end
