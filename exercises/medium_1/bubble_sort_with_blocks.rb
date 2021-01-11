# Your task in this assignment is to modify #bubble_sort! so it takes an optional block that determines which of two consecutive elements will appear first in the results.

# def bubble_sort!(array)
#   counter = 0

#   array.size.times do
#     while counter < array.size - 1
#       if array[counter] < array[counter + 1]
#         counter += 1
#         next
#       end
#       array[counter], array[counter + 1] = array[counter + 1], array[counter]
#     end
#     counter  = 0
#   end

#   array
# end


def bubble_sort!(array)
  counter = 0

  array.size.times do
    while counter < array.size - 1
      if block_given?
        if yield(array[counter], array[counter + 1])
          counter += 1
          next
        end
      else
        if array[counter] < array[counter + 1]
          counter += 1
          next
        end
      end
      array[counter], array[counter + 1] = array[counter + 1], array[counter]
    end

    counter  = 0
  end

  array
end


array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)