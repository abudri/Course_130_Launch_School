require 'minitest/autorun'
require "minitest/reporters" # helps give colored formatting
Minitest::Reporters.use! #  helps give colored formatting
# https://launchschool.com/lessons/dd2ae827/assignments/3a8a5aa5

require_relative 'car'

class CarTest < MiniTest::Test
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  def test_bad_wheels
    skip('boom shakala') # skipping, this was a failed test example
    car = Car.new
    assert_equal(3, car.wheels)
  end

  #

  # below are from Assertions assignment Lesson 2
  # https://launchschool.com/lessons/dd2ae827/assignments/fe2ff54a
  def test_car_exists
    car = Car.new
    assert(car)
  end

  def test_name_is_nil
    car = Car.new
    assert_nil(car.name)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      car = Car.new(name: "Joey")         # this code raises ArgumentError, so this assertion passes
    end
  end

  def test_instance_of_car
    car = Car.new
    assert_instance_of(Car, car)
  end
    # This test is more useful when dealing with inheritance. This example is a little contrived.

  def test_includes_car
    car = Car.new
    arr = [1, 2, 3]
    arr << car

    assert_includes(arr, car)
  end

end
