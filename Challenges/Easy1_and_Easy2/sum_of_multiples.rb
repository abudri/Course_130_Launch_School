# Challenges, Easy 1
# https://launchschool.com/exercises/780205f1

class SumOfMultiples
  
  attr_accessor :multiples

  def initialize(*multiples) # * turns multiple inputs into array
    @multiples = multiples.empty? ? [3, 5] : multiples
  end

  def self.to(max, multiples = [3, 5]) # up to num.  Class method, multiples 3, 5 default
    result = []
    0.upto(max - 1) do |i|
      multiples.each do |multiple|
        result << i if i % multiple == 0
      end
    end
    result.uniq.sum
  end

  def to(max) # instance method
    self.class.to(max, multiples)
  end
end


