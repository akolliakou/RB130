# For this exercise you'll be given a sample text file and a starter class. 
# The sample text's contents will be saved as a String to an instance 
# variable in the starter class.

# The Text class includes a #swap method that can be used to replace all 
# occurrences of one letter in the text with another letter. And for this 
# exercise we will swap all occurrences of 'a' with 'e'.

# Your task is to write a test suite for class Text. In that test suite 
# write a test for the Text method swap. For this exercise, you are required 
# to use the minitest methods #setup and #teardown. The #setup method 
# contains code that will be executed before each test; #teardown contains 
# code that will be executed after each test.

class Text
  def initialize(text)
    @text = text
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end

  def word_count
    @text.split.count
  end
end

require 'minitest/autorun'

class TextTest < Minitest::Test
  def setup
    @file = File.open('text.txt', 'r')
  end

  def test_swap
    text = Text.new(@file.read)
    actual_text = text.swap('a', 'e')
    expected_text = <<~TEXT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT

    assert_equal(expected_text, actual_text)
  end

  def teardown
    @file.close
  end
end