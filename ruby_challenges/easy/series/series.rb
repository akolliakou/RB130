# Write a program that will take a string of digits and give you 
# all the possible consecutive number series of length n in that 
# string.

# For example, the string "01234" has the following 3-digit 
# series:

# - 012
# - 123
# - 234

# And the following 4-digit series:

# - 0123
# - 1234

# And if you ask for a 6-digit series from a 5-digit string, 
# you deserve whatever you get.

class Series
  def initialize(str)
    @str = str
  end

  def slices(length)
    raise ArgumentError, "That's more slices than the length of string!" unless length <= @str.size
    @str.chars.map(&:to_i).each_cons(length).to_a
  end
end

# a_series = Series.new('012345')
# a_series.slices(3)

