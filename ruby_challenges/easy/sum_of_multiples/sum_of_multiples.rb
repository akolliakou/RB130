# Write a program that, given a number, can find the sum of all the 
# multiples of particular numbers up to but not including that number.

# If we list all the natural numbers up to but not including 20 that 
# are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. 
# The sum of these multiples is 78.

# Write a program that can find the sum of the multiples of a given 
# set of numbers. If no set of numbers is given, default to 3 and 5.

class SumOfMultiples
  def initialize(*numbers)
    numbers.empty? ? @numbers = [3, 5] : @numbers = numbers
  end

  def self.to(num)
    self.new.to(num)
  end

  def to(num)
    multiples = []
    range = (1...num).to_a

    range.each do |int|
      @numbers.each do |num|
        multiples << int if int % num == 0
      end
    end

    multiples.uniq.sum
  end
end

# a = SumOfMultiples.new(7, 13, 17)
# p a.to(20)
# p SumOfMultiples.to(1000)