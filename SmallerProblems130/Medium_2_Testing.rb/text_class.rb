# Medium 2 - Testing - Last 3 problems
# https://launchschool.com/exercises/20ec4425

class Text
  
  def initialize(text)
    @text = text
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end

  def word_count
    @text.split.count
  end
end

