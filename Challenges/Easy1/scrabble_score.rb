

class Scrabble
  VALUES = { "aeioulnrst" => 1, 'dg' => 2, 'bcmp' => 3,
            'fhvwy' => 4, 'k' => 5, 'jx' => 8, 'qz' => 10 }

  attr_reader :word

  def initialize(word)
    @word = word == nil ? '' : word.downcase
  end

  def self.score(word)
    self.new(word).score # creates a new Scrabble object, then calls Scrabble#score on it
  end

  def score
    score = 0

    word.each_char do |char|
      VALUES.each {|key, value| key.include?(char) ? score += value : next }
    end
    score
  end
end