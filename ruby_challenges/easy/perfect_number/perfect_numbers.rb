# The Greek mathematician Nicomachus devised a classification scheme 
# for natural numbers, identifying each as belonging uniquely to the 
#   categories of abundant, perfect, or deficient. A perfect number 
#   equals the sum of its positive divisors — the pairs of numbers 
#   whose product yields the target number, excluding the number 
#   itself. This sum is known as the Aliquot sum.

# Perfect: Sum of factors = number
# Abundant: Sum of factors > number
# Deficient: Sum of factors < number
# Examples:

# 6 is a perfect number because its divisors are 1, 2, 3 and 6 = 1 + 2 + 3.
# 28 is a perfect number because 28 = 1 + 2 + 4 + 7 + 14.
# Prime numbers 7, 13, etc are deficient by the Nicomachus classification.
# Write a program that can tell if a number is perfect, abundant or deficient.

class PerfectNumber
  def self.classify(num)
    raise StandardError, "Only positive numbers allowed!" if num < 0

    if sum_of_factors(num) == num
      'perfect'
    elsif sum_of_factors(num) < num
      'deficient'
    else
      'abundant'
    end
  end

  def self.sum_of_factors(num)
    range = (1...num).to_a
    divisors = []

    range.each do |int|
      divisors << int if num % int == 0
    end

    divisors.reduce(:+)
  end
end

# PerfectNumber.classify(13)