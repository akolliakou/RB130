# Write a program that given a phrase can count the occurrences of 
# each word in that phrase.

# For example, if we count the words for the input "olly olly in 
# come free", we should get:

# olly: 2
# in: 1
# come: 1
# free: 1

class Phrase
  def initialize(string)
    @string = string
    p @word_array = @string.gsub("\n", '').gsub(/^'|'$/, ' ').delete("^'a-zA-Z0-9 ").squeeze(" ").downcase
  end

  def word_count
    new_hash = {}
    clean_arr = @word_array.split(/[, ]/)

    clean_arr.each do |word|
      if new_hash.include?(word)
        new_hash[word] += 1
      else
        new_hash[word] = 1
      end
    end

    new_hash
  end
end

a = Phrase.new("Joe can't tell between 'large' and large.")
p a.word_count