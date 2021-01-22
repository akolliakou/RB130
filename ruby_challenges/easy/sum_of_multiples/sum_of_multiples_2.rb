=begin
Problem:
- Given a number
- And optionally a set of integers - default 3 and 5
- return the sum of all the multiples of the set (or 3 and 5) that are in
the range between 1 and the given number

Rules:
- final multiples collection should include unique integers only

Data structure
- Integers in
- Integer out

Algorithm:
- to
 - initialise results to empty array
 - create range from 1 and up to given number - 1
 - iterate over each integer in range
  - iterate over each given integer
   - check if given integer modulo range integer == 0
    - if so add range integer to array
 - make array unique
 - sum the array integers
=end

class SumOfMultiples
  def initialize(*numbers)
    numbers.empty? ? @numbers = [3, 5] : @numbers = numbers
  end

  def self.to(num)
    new.to(num)
  end

  def to(number)
    results = []

    (1...number).each do |num|
      @numbers.each do |int|
        results << num if num % int == 0
      end
    end

    results.uniq.sum
  end
end

p SumOfMultiples.to(1000)