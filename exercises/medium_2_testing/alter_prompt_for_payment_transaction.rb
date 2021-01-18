# You may have noticed something when running the test for the 
# previous exercise. And that is that our minitest output wasn't that clean. 
# We have some residual output from the Transaction#prompt_for_payment method.

# Run options: --seed 52842

# # Running:

# You owe $30.
# How much are you paying?
# .

# Finished in 0.001783s, 560.7402 runs/s, 560.7402 assertions/s.

# 1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
# Transaction#prompt_for_payment has a call to Kernel#puts and that output is showing up when we run our test. Your task for this exercise is to make it so that we have "clean" output when running this test. We want to see something like this:

# Run options: --seed 4957

# # Running:

# .

# Finished in 0.000919s, 1087.9984 runs/s, 1087.9984 assertions/s.

# 1 runs, 1 assertions, 0 failures, 0 errors, 0 skips


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

    def test_prompt
      input = StringIO.new("40\n")
      output = StringIO.new
      @transaction.prompt_for_payment(input: input)
      assert_equal(40, @transaction.amount_paid)
    end
  end