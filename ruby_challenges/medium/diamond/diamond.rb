# The diamond exercise takes as its input a letter, and outputs it in a
# diamond shape. Given a letter, it prints a diamond starting with 'A',
# with the supplied letter at the widest point.

# The first row contains one 'A'.
# The last row contains one 'A'.
# All rows, except the first and last, have exactly two identical letters.
# The diamond is horizontally symmetric.
# The diamond is vertically symmetric.
# The diamond has a square shape (width equals height).
# The letters form a diamond shape.
# The top half has the letters in ascending order.
# The bottom half has the letters in descending order.
# The four corners (containing the spaces) are triangles.

# Diamond for letter 'C':

#   A
#  B B
# C   C
#  B B
#   A

class Diamond
  def self.make_diamond(letter)
    (triangle_up(letter) + triangle_down(triangle_up(letter))).join("\n") + "\n"
  end

  def self.triangle_up(letter)
    letter_range = ('A'..letter).to_a
    range_size = (letter_range.size * 2) - 1
    counter1 = range_size / 2
    counter2 = range_size / 2

    make_triangle(counter1, counter2, letter_range, range_size)
  end

  def self.triangle_down(arr)
    arr.reverse!.shift
    arr
  end

  def self.make_triangle(counter1, counter2, letter_range, range_size)
    results = []

    letter_range.each do |letter|
      arr = Array.new(range_size).map { |_| ' ' }
      arr[counter1] = letter
      arr[counter2] = letter
      results << arr
      counter1 -= 1
      counter2 += 1
    end

    convert_subarrays_to_str(results)
  end

  def self.convert_subarrays_to_str(arr)
    final_arr = []

    arr.each do |subarr|
      string = ''
      subarr.each do |char|
        string << char
      end
      final_arr << string
    end

    final_arr
  end
end
