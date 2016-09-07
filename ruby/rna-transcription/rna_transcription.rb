module Complement
  DNA_BASES = 'GCTA'.freeze
  RNA_BASES = 'CGAU'.freeze

  def self.of_dna(strand)
    return '' if strand !~ /^[#{DNA_BASES}]+$/
    strand.tr(DNA_BASES, RNA_BASES)
  end
end

module BookKeeping; VERSION = 4; end
