# Implement octal to decimal conversion. Given an octal input 
# string, your program should produce a decimal output.

# Note:

# Implement the conversion yourself. Do not use something else 
# to perform the conversion for you. Treat invalid input as octal 
# 0.

# About Octal (Base-8):

# Decimal is a base-10 system.

# A number 233 in base 10 notation can be understood as a linear 
# combination of powers of 10:

# The rightmost digit gets multiplied by 100 = 1
# The next number gets multiplied by 101 = 10
# ...
# The n*th number gets multiplied by 10n-1*.
# All these values are summed.

#   233 # decimal
# = 2*10^2 + 3*10^1 + 3*10^0
# = 2*100  + 3*10   + 3*1

class Octal
  def initialize(str)
    @array = str.chars.reverse
  end

  def to_decimal
    return 0 if @array.any? { |el| el =~ /[^0-7]/ }

    int_arr = @array.map(&:to_i)

    int_arr.map.with_index do |int, idx|
      int * (8 ** idx)
    end.sum
  end
end

# a = Octal.new('233')
# a.to_decimal