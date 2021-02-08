# Write a program that computes Pascal's triangle up to a given number of
# rows.

# In Pascal's Triangle each number is computed by adding the numbers to
# the right and left of the current position in the previous row.

#     1
#    1 1
#   1 2 1
#  1 3 3 1
# 1 4 6 4 1
# # ... etc


class Triangle
  def initialize(num_of_rows)
    @num_of_rows = num_of_rows
  end

  def rows
    array = [[1]]

    until array.size == @num_of_rows
      array << [1] + array.last.each_cons(2).map(&:sum) + [1]
    end

    array
  end

  def last
    rows.last
  end
end