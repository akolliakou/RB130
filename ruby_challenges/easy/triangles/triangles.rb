# Write a program to determine whether a triangle is equilateral, 
# isosceles, or scalene.

# An equilateral triangle has all three sides the same length.

# An isosceles triangle has exactly two sides of the same length.

# A scalene triangle has all sides of different lengths.

# Note: For a shape to be a triangle at all, all sides must be of 
# length > 0, and the sum of the lengths of any two sides must be 
# greater than or equal to the length of the third side.

class Triangle
  def initialize(*sides)
    @array = sides
    raise ArgumentError unless valid?
  end

  def kind
    if equilateral?
      "equilateral"
    elsif isosceles?
      "isosceles"
    else
      "scalene"
    end
  end

  def valid?
    @array.all? { |side| side > 0 } &&
      @array[0] + @array[1] >= @array[2] &&
      @array[1] + @array[2] >= @array[0] &&
      @array[0] + @array[2] >= @array[1]
  end

  def equilateral?
    @array.uniq.count == 1
  end

  def isosceles?
    @array.uniq.count == 2
  end

  def scalene?
    @array.uniq.count == 3
  end
end
