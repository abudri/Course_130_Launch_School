# Medium 2 - Testing - Last 3 Problems
# https://launchschool.com/exercises/530e4c03

require 'minitest/autorun'

require_relative 'text_class'

class TextTest < Minitest::Test

  def setup
    @file = File.open('./sample_text.txt', 'r')
  end

  def test_swap
    text = Text.new(@file.read)
    actual_text = text.swap('a', 'e')
    expected_text = <<~TEXT 
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.\nSuspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet\nquem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo\nnulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum\ndolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres\net verius meuris, et pheretre mi.
    TEXT
    assert_equal(expected_text, actual_text)
  end

  def test_word_count
    text = Text.new(@file.read)
     # actual count is 72 words
    actual_count = text.word_count
    assert_equal(72, actual_count)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end

