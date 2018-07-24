# LS 130: Challenges > Medium 1 > Grade School
# https://launchschool.com/exercises/a8a8db78

class School
  attr_accessor :school

  def initialize
    @school = Hash.new([]) # creates hash for which initial values are empty array to which we can push values
  end

  def add(name_str, grade)
    school.has_key?(grade) ? school[grade].push(name_str) : school[grade] = [name_str]
    # above checks if key exists alreay, if so it is pushed to names value array, if not, the
    # key/value pair is established newly in the hash
  end

  def to_h
    school.sort_by {|k, v| k }.each {|el| el[1].sort!}.to_h  # getter for @school, which is a hash already
    # above #sorts_by grade(k), and then #each sorts element at index 1 of each nested array of [grade, [names]],
    #giving us the names in alphabetical order, then we simply conver it back to a hash
  end

  def grade(grade_number)
    school.values_at(grade_number).flatten
  end
end

