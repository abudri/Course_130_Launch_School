class Anagram
  attr_reader :word # not needed in fact since we access instance variable directly

  def initialize(word)
    @word = word
  end

  def match(potential_anagrams_arr)
    potential_anagrams_arr.select { |word| anagram?(word, @word) }
  end

  private 

  def anagram?(word1, word2)
    return false if word1.downcase == word2.downcase
    word1.downcase.chars.sort == word2.downcase.chars.sort
  end
end