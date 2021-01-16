# Write a test that verifies that Transaction#prompt_for_payment 
# sets the amount_paid correctly

class Transaction
  attr_reader :item_cost
  attr_accessor :amount_paid

  def initialize(item_cost)
    @item_cost = item_cost
    @amount_paid = 0
  end

  def prompt_for_payment(input: $stdin)
    loop do
      puts "You owe $#{item_cost}.\nHow much are you paying?"
      @amount_paid = input.gets.chomp.to_f # notice that we call gets on that parameter
      break if valid_payment? && sufficient_payment?
      puts 'That is not the correct amount. ' \
           'Please make sure to pay the full cost.'
    end
  end

  private

  def valid_payment?
    amount_paid > 0.0
  end

  def sufficient_payment?
    amount_paid >= item_cost
  end

  def sufficient_payment?
    amount_paid >= item_cost
  end
end

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(40)
  end

  def test_prompt_for_payment
    input = StringIO.new("40\n")
    @transaction.prompt_for_payment(input: input)
    assert_equal(40, @transaction.amount_paid)
  end
end