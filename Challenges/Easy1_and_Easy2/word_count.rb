# Challenges > Easy 1 > Word Count
# https://launchschool.com/exercises/e060c934

class Phrase
  attr_reader :words

  def initialize(phrase)
    @words = phrase.split(/[\s,]/) # splits if space, or comma
                   .select {|word| word.match(/[a-zA-Z0-9]/)}
                   .map {|word| transform(word)}
  end

  def transform(word)
    word.gsub(/[^a-zA-Z0-9']|^'|'$/, '').downcase  # for case insensitivity test
  end  # ... |^'|'$ gets rid of start/end quotes for last test in test suite

  def word_count
    result = {}
    words.each do |word|
      result[word] = words.count(word)
    end
    result # return result
  end
end



=begin 

less condense version of transform method:

 def transform(word)
    word.gsub(/[^a-zA-Z0-9']/, '').gsub(/^'|'$/,'').downcase  # for case insensitivity test
 end  # second .gsub above gets rid of start/end quotes for last test in test suite

Tannr/others had a solution implementing this as well or some form:
    .scan(/\w+'?\w+|\w+/)

Here it is refactored as well:


class Phrase
  attr_reader :words

  def initialize(phrase)
    @words = phrase.downcase.scan(/\w+'?\w+|\w+/)
  end

  def word_count
    result = {}
    words.each do |word|
      result[word] = words.count(word)
    end
    result # return result
  end
end


=end
