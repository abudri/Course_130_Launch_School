# LS 130
# Challenges > Easy 1 > Series
# https://launchschool.com/exercises/3db163fb

class Series
  attr_reader :num_arr

  def initialize(number)
    @num_arr = number.split('').map(&:to_i)
  end

  def slices(slice_length)
    raise ArgumentError, 'Slices can not be longer than array size itself' if num_arr.size < slice_length

    i = slice_length
    start = 0
    count = num_arr.size # Array#size here
    result = []

    while i < count + 1
      result << num_arr[start..i - 1]
      i += 1
      start += 1
    end
    result
  end
end

=begin 

def slices(num_arr, n)
  i = n
  start = 0 
  count = num_arr.size
  result = []

  while i < count + 1
    result << num_arr[start..i - 1]
    i += 1
    start += 1
  end
  result
end


Understand the problem: given
01234

Set up your test cases: given

Describe your inputs, outputs, and data structures:
-------------------
Inputs: single string of digits
in the Series#slices instance method, input `n` is slices

Outputs: a nested array contained all the slices of numbers you can 
have in `n` succession, according to Series#slices instance method call

Data structure(s): string input of a number string
nested array is output

Describe your algorithm: 
convert the string number into an array of its digits, <number>.to_i.digits.reverse
- '1234'.to_i.digits.reverse # => [1, 2, 3, 4]
based on `n` argument for Series#slices instance method, put into a
return array the first `n` elements of digits array, then the next 'n', up until end of array


Begin Coding


=end