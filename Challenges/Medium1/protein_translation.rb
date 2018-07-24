# LS 130, Challenges > Medium 1 > Protein Translation
# https://launchschool.com/exercises/ba813e5c
class Translation
  VALUES = { 'AUG' => 'Methionine', ["UUU", "UUC"] => 'Phenylalanine',
          ["UUA", "UUG"] => 'Leucine', ["UCU", "UCC", "UCA", "UCG"] => 'Serine',
          ["UAU", "UAC"] => 'Tyrosine', ["UGU", "UGC"] => 'Cysteine',
          'UGG' => 'Tryptophan'}
  STOP = ["UAA", "UAG", "UGA"]

  def self.of_codon(codon)
      return 'STOP' if STOP.include?(codon)
      VALUES.select {|k,_| k.include?(codon) }.values.first
  end

  def self.of_rna(strand)
    raise InvalidCodonError, "'A', 'U', 'G', 'C' are only valid nucleotides" if strand.match(/[^AUCG]/)

    strand.scan(/.../).map {|codon| self.of_codon(codon) } # self.of_codon is class method call above, Translation#of_codon
          .take_while {|el| el != 'STOP' } # returns array portion before encountering a 'STOP' element value returned from #of_codon in block
  end
end

class InvalidCodonError < StandardError # creating custom error class for error `InvalidCodonError`
end
