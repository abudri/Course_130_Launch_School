class Sieve
  attr_reader :range

  def initialize(num)
    @range = (2..num).to_a
  end

  def primes
    range.each do |prime|
      range.each do |num|
        range.delete(num) if (num != prime) && (num % prime == 0)
      end
    end
    range
  end
end
