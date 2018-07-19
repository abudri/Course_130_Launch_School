class Octal
  attr_reader :num, :str_num

  def initialize(str_num)
    @num = str_num.to_i
    @str_num = str_num
  end

  def to_decimal
    num_arr = num.digits # reverses order of digits, desirable
    return 0 if str_num.chars.any? { |el| /[^0-7]/ =~ el } # octal digits are only 0-7

    num_arr.each_with_index.map do |num, idx|
      num * 8**idx
    end.sum
  end
end
