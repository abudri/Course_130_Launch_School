# Challenges, Easy 1
# https://launchschool.com/exercises/a74a58d6

class Trinary
  BASE = 3
  INVALID = /[^0-2]/

  attr_reader :trinary_str

  def initialize(trinary_str)
    @trinary_str = trinary_str
  end

  def to_decimal
    return 0 if trinary_str.chars.any? {|el| INVALID =~ el }
    num_arr = trinary_str.to_i.digits # reverses order of digits, desirable

    num_arr.each_with_index.map { |num, idx| num * BASE**idx }.sum
  end
end
