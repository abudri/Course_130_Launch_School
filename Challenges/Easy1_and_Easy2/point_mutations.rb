# Challenges, Easy 1
# https://launchschool.com/exercises/b94c1dcb


class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    mismatches = 0
    shorter, other = [strand, other_strand].sort_by(&:size)

    shorter.each_char.with_index { |char, idx| mismatches += 1 unless char == other[idx] }
    mismatches
  end
end

=begin
above is refactored, original below

class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    mismatches, idx = 0, 0
    count = strand.size < other_strand.size ? strand.size : other_strand.size

    while idx < count
      mismatches += 1 if strand[idx] != other_strand[idx]
      idx += 1
    end
    mismatches
  end
end

=end 


