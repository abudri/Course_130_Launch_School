

class SecretHandshake
  attr_reader :input
  VALUES =  ['wink', 'double blink', 'close your eyes', 'jump']

  def initialize(input)
    @input = if input.is_a?(Integer) then input.to_s(2) #converts number to binary string
             elsif input.match(/[^01]/) then '0'
             else input
             end   
  end

  def commands
    result = []
    input.reverse[0..3].chars.each_with_index do |binary_digit, idx|
      result.push(VALUES[idx]) if binary_digit == '1'
    end
    input.reverse[4] == '1' ? result.reverse : result
  end
end

=begin
take a decimal number OR take a string binary

 The program should consider strings specifying an invalid binary as the value 0.

 1 = wink
10 = double blink
100 = close your eyes
1000 = jump


10000 = Reverse the order of the operations in the secret handshake.

8 >>> 1000
3.to_s(2) >>> '11' # ['wink', 'double blink']
8.to_s(2) >>> '1000'
19.to_s(2) >>> '10011' #  ['double blink', 'wink']
=end