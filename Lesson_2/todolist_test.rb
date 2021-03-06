
# https://launchschool.com/lessons/dd2ae827/assignments/cf0f8d58
# Lesson 2, Assignment 7: Write a test suite for TodoList

require 'simplecov' # Code Coverage Lesson 2, https://launchschool.com/lessons/dd2ae827/assignments/9f7c1f7c
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos") # 
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @todos.size) #  @todos is 3 in size, line 17
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done
    assert_equal(false, @list.done?) # .done? a ToDoList method, or accessible to it?
  end

  def test_add_raise_error
    assert_raises(TypeError) { @list.add("string object") }
    assert_raises(TypeError) { @list.add(1)}
    # Note that we chose to go with two assertions here to verify an integer 
    # and string, respectively, generates an error. To be extra safe, you can add even more.
  end

  # Write a test that verifies whether the << method(shovel method) does actually add a Todo to our TodoList.
  def test_shovel # <<
    todo4 = Todo.new("Study Coding")
    @list << todo4  # using ToDo#<< here
    @todos << todo4 # using Array#<< here
    assert_equal(@todos, @list.to_a)
  end

  def test_add
    todo4 = Todo.new("Study Coding")
    @list.add(todo4)
    @todos << todo4 #using Array#<< here
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(100) } # out of bound index
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1)) # index starts at 0
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100)} # 100 is out of index
    @list.mark_done_at(1) # marks @todo2 done
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100)} # 100 is out of index
    @todo1.done!
    @todo2.done!
    @todo3.done!# @todo1, @todo2, @todo3 should all be marked done
    @list.mark_undone_at(1)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_mark_all_done
    @list.mark_all_done
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)  #ToDoList#done?
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    @list.remove_at(1)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_one_done # test when one item is marked done
    
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    # @todo1.done! --> could do this instead of below line
    @list.mark_done_at(1)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_one_done # test when one item is marked done
    
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT

    # @todo1.done! --> could do this instead of below line
    @list.mark_done_at(1)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_all_done # test when one item is marked done
    
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    # @todo1.done! and @todo2, 3, so on--> could do this instead of below line
    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    result = []
    @list.each {|todo| result << todo}
    assert_equal([@todo1, @todo2, @todo3], result)
  end

  def test_each_return
    result = @list.each {|todo| todo } #nothing is done inside block really, seeing if return is self(which is @list)
    assert_equal(@list, result)
  end

  def test_select
  @todo1.done!
  list = TodoList.new(@list.title)
  list.add(@todo1)

  assert_equal(list.title, @list.title)
  assert_equal(list.to_s, @list.select{ |todo| todo.done? }.to_s)
end
end
