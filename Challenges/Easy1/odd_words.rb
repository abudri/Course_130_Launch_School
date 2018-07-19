# https://launchschool.com/exercises/506e9823
=begin 
Considered a character set consisting of Letters, a space, and a point. 
Words consist of one or more, but at most 20 letters.  
An input text consists of one or more words, separated from each other by 
one or more spaces and terminated by 0 or more spaces followed by a point.  
Input should be read from, and including, the first letter of the first word,
 up to and including a terminating point.  The output text is to be produced 
 such that successive words are separated by a single space with the last word being terminated by a single point.  Odd words are copied in reverse order while even words are merely echoed.  For example, the input string

# note: limit to 20 charactres didn't seem important if i remember video right, didn't have this limit
=end

def reverse_odd_words(str)
  raise TypeError, 'String can only contain letters, spaces and a period' if str.match(/[^a-zA-Z\s+.]/)
  
  str.include?('.') ? period_flag = true : period_flag = false
  word_arr = str.gsub('.', '').split(/\s+/) # .gsub the '.' for '' in case str has a period
  result = word_arr.map.with_index {|word, idx| idx.odd? ? word.reverse : word }.join(' ')
  result += '.' if period_flag  # if period_flag true (Original string has period), append it to solution
  result
end
