# Write a program that can tell you what the nth prime is.

# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
# we can see that the 6th prime is 13.

# Do not use Ruby's Prime class nor any of the prime-number testing
# methods in the Integer class.

class Prime
  def self.nth(num)
    raise ArgumentError if num < 1

    counter = 2
    arr = []

    until num == arr.size
      arr << counter if prime?(counter)
      counter += 1
    end

    arr.last
  end

  def self.prime?(num)
    (2..num / 2).none? { |int| num % int == 0 }
  end
end
