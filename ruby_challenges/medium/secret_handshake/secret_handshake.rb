# Write a program that will take a decimal number, and convert it
# to the appropriate sequence of events for a secret handshake.

# There are 10 types of people in the world: Those who understand
# binary, and those who don't. You and your fellow cohort of those
# in the "know" when it comes to binary decide to come up with
# a secret "handshake".

# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump

# 10000 = Reverse the order of the operations in the secret handshake.

# handshake = SecretHandshake.new 9
# handshake.commands # => ["wink","jump"]

# handshake = SecretHandshake.new "11001"
# handshake.commands # => ["jump","wink"]

# The program should consider strings specifying an invalid binary
# as the value 0.

class SecretHandshake
  def initialize(input)
    @input = input
  end

  def commands
    binary(@input)
    handshake = []

    handshake << 'wink' if binary[-1] == '1'
    handshake << 'double blink' if binary[-2] == '1'
    handshake << 'close your eyes' if binary[-3] == '1'
    handshake << 'jump' if binary[-4] == '1'
    handshake.reverse! if binary[-5] == '1'
    handshake
  end

  def binary
    return [] if @input.is_a?(String) && @input.match(/[a-zA-Z2-9]/)
    @input.is_a?(String) ? @input : convert_to_binary(@input)
  end

  def convert_to_binary(num)
    binary_string = ''

    until num == 0
      num, remainder = num.divmod(2)
      binary_string << remainder.to_s
    end

    binary_string.reverse
  end
end
