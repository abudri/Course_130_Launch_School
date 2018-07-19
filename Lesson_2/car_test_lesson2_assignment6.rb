
require 'minitest/autorun'
require "minitest/reporters" # helps give colored formatting
Minitest::Reporters.use! #  helps give colored formatting
# https://launchschool.com/lessons/dd2ae827/assignments/3a8a5aa5

require_relative 'car'

class CarTest < MiniTest::Test
  def test_value_equality
    car1 = Car.new
    car2 = Car.new

    car1.name = "Kim"
    car2.name = "Kim"

    assert_equal(car1, car2)
  end
end
