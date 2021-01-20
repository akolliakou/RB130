# Recall that in the last exercise we only had to test one method of our 
# Text class. One of the useful facets of the setup and teardown methods 
# is that they are automatically run before and after each test respectively. 
# To show this we'll be adding one more method to our Text class, word_count.

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

  # def test_swap
  #   text = Text.new(@file.read)
  #   actual_text = text.swap('a', 'e')
  #   expected_text = <<~TEXT.chomp
  #   Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
  #   Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
  #   quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
  #   nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
  #   dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
  #   et verius meuris, et pheretre mi.
  #   TEXT

  #   assert_equal(expected_text, actual_text)
  # end

  def test_count
    text = Text.new(@file.read)
    assert_equal(72, text.word_count)
  end

  def teardown
    @file.close
  end
end