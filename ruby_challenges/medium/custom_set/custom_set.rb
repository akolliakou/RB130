# Create a custom set type.

# Sometimes it is necessary to define a custom data structure of some type, l
# ike a set. In this exercise you will define your own set type. How it works 
# internally doesn't matter, as long as it behaves like a set of unique elements 
# that can be manipulated in several well defined ways.

# In some languages, including Ruby and JavaScript, there is a built-in Set type. For this problem, you're expected to implement your own custom set type. Once you've reached a solution, feel free to play around with using the built-in implementation of Set.

# For simplicity, you may assume that all elements of a set must be numbers.

=begin
Problem:
- Given an optional array of integers
- Create a custom set that can call the following methods:
 - empty?
  - returns true if array doesn't contain any elements
 - contains?
  - returns true if array contains argument
 - subset?
  - returns true if any of the possible consecutive combinations are part of array
 - disjoint?
  - 
 - eql?
  - returns true if the same as sorted and unique array
 - add
  - 
 - intersection
 - difference
 - union
  - adds two sets together - unique only
=end

class CustomSet
  attr_accessor :set

  def initialize(set = [])
    @set = set
  end

  def empty?
    set.empty?
  end

  def contains?(int)
    set.include?(int)
  end

  def eql?(arr)
    set.sort.uniq == arr.set.sort
  end

  def add(int)
    set << int unless contains?(int)
    self
  end

  def subset?(arr)
    set.all? { |int| arr.contains?(int)}
  end

  def disjoint?(arr)
    set.none? { |int| arr.contains?(int) }
  end

  def difference(arr)
    different_set = set.select { |int| !arr.contains?(int) }
    CustomSet.new(different_set)
  end

  def union(arr)
    unioned_set = CustomSet.new(set)
    arr.set.each { |int| unioned_set.add(int) }
    unioned_set
  end

  def intersection(arr)
    common_ints = set.select { |int| arr.contains?(int) }
    CustomSet.new(common_ints)
  end

  def ==(arr)
    eql?(arr)
  end
end

p CustomSet.new([1, 3]).union(CustomSet.new([2, 3]))
