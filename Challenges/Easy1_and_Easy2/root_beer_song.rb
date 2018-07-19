# Easy 2, no.3 Beer Song
# https://launchschool.com/exercises/0146ea42
# My discussion on forums: https://launchschool.com/posts/c074822c#reply

class BeerSong

  def verse_string(number)
    "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
      "Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
  end

  def verse(number)
    if number == 0 
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    elsif number == 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    elsif number == 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    else
      verse_string(number)
    end
  end

  def verses(start_at, end_at)
    result = []
    start_at.downto(end_at) {|i| result << verse(i) }  # call #verse method just above
    result.join("\n")
  end

  def lyrics  # returns the whole song lyrics
    verses(99, 0)  # call #verses method just above
  end
end
