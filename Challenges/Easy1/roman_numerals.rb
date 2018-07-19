# https://launchschool.com/exercises/23ed6a7d

class Integer
  # video explains that we are using Integer class, and adding this method
  # to the class, so 1.to_roman will work outside the class on command line and so on
  ROMAN_NUMERAL_RULES = { 'M' => 1000, 'CM' => 900, 'D' => 500, 'CD' => 400,
          'C' => 100, 'XC' => 90, 'L' => 50, 'XL' => 40, 'X' => 10,
          'IX' => 9, 'V' => 5, 'IV' => 4, 'I' => 1 }

  def to_roman
    roman_numeral = '' # empty string to be added to / concatenated
    number = self #avoids mutating self itself
    # self. here is the number itself, lke 5.to_roman, 5 is self

    ROMAN_NUMERAL_RULES.each do |roman_number, value| # roman_number being the key here
      number_of_roman_letters = number / value
      roman_numeral += roman_number * number_of_roman_letters 
      number -= value * number_of_roman_letters 
    end
    roman_numeral
  end
end