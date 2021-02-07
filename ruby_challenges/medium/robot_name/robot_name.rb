# Write a program that manages robot factory settings.

# When robots come off the factory floor, they have no name. The first time 
# you boot them up, a random name is generated, such as RX837 or BC811.

# Every once in a while, we need to reset a robot to its factory settings, 
# which means that their name gets wiped. The next time you ask, it will respond with a new random name.

# The names must be random; they should not follow a predictable sequence. 
# Random names means there is a risk of collisions. Your solution should not 
# allow the use of the same name twice when avoidable.

LETTERS = ('A'..'Z').to_a
NUMBERS = ('0'..'9').to_a

class Robot
  @@names = []

  def name
    return @name if @name
    @name = get_name while @@names.include?(@name) || @name == nil
    @@names << @name
    @name
  end

  def reset
    @@names.delete(@name)
    @name = nil
  end

  def get_name
    name = ''
    2.times { name << LETTERS[rand(26)] }
    3.times { name << NUMBERS[rand(10)] }
    name
  end
end
