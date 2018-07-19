# Course 130 LS, Lesson 2, Assignment 5
# https://launchschool.com/lessons/dd2ae827/assignments/5c80633e
# idea of this lesson is instead of instantiating a 'car' object in each
# test instance method, used the setup instance method and utilize its
# @car instance variable which will be accessible to all other test instance methods
# unlike an car object, which will have to be declared locally in each individual 
# test instance method
# ultimately, this cleans up and DRYs our code more nicely, this is refactored

require 'minitest/autorun'

require_relative 'car'

class CarTest < MiniTest::Test
  def setup
    @car = Car.new
  end

  def test_car_exists
    assert(@car)
  end

  def test_wheels
    assert_equal(4, @car.wheels)
  end

  def test_name_is_nil
    assert_nil(@car.name)
  end

  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      car = Car.new(name: "Joey")
    end
  # Finally, note that we do not use @car in the test_raise_initialize_with_arg test, 
  # because we're using Car.new with arguments in this test.
  end

  def assert_instance_of_car
    assert_instance_of(Car, @car)
  end

  def test_includes_car
    arr = [1, 2, 3]
    arr << @car

    assert_includes(arr, @car)
  end
end
