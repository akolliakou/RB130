# Given this code:

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# Fill out the following method calls for gather so that they produce the 
# corresponding output shown in numbers 1-4 listed below:

# 1)

gather(items) do |*a, b|
  puts a.join(', ')
  puts b
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

# 2)

gather(items) do |a, *b , c|
  puts a
  puts b.join(', ')
  puts c
end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

# 3)

gather(items) do |a, *b|
  puts a
  puts b.join(', ')
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

# 4)

gather(items) do |a, b, c, d|
  puts [a, b, c, d].join(', ')
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!
