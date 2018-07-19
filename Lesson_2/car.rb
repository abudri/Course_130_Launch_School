class Car
  attr_accessor :wheels, :name

  def initialize
    @wheels = 4
  end

  def ==(other)  # assert_equal would fail without this method
    other.is_a?(Car) && name == other.name
  end
  # above from Lesson 2, assign 6, Testing Equality
  # https://launchschool.com/lessons/dd2ae827/assignments/bcce2222
end

