# Medium 1 Problems
=begin

Text Analyzer - Sandwich Code
Fill out the rest of the Ruby code below so that print output like that shown in "Sample Output." You should read the text from a simple text file that you provide. (We also supply some example text below, but try the program with your text as well.)

Read the text file in the #process method and pass the text to the block provided in each call. Everything you need to work on is either part of the #process method or part of the blocks. You need no other additions or changes.

The text you use does not have to produce the same numbers as the sample output but should have the indicated format.

class TextAnalyzer
  def process
    # your implementation
  end
end

analyzer = TextAnalyzer.new
analyzer.process { puts # your implementation }
analyzer.process { puts # your implementation }
analyzer.process { puts # your implementation }


=end
# https://launchschool.com/exercises/c618c0e4

class TextAnalyzer
  def process
    file = File.open('sample_text_file.txt', 'r') # opens file
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs." }
analyzer.process { |text| puts "#{text.split("\n").count} lines." }
analyzer.process { |text| puts "#{text.split(" ").count} words." }