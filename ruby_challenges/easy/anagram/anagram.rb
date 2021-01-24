# Write a program that, given a word and a list of possible anagrams, 
# selects the correct sublist that contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates like 
# "enlists" "google" "inlets" "banana" the program should return a list 
# containing "inlets". Please read the test suite for exact rules of 
# anagrams.

class Anagram
  def initialize(word)
    @word = word
  end

  def match(list)
    results = []

    list.each do |string|
      word_given = @word.downcase.chars.sort 
      string_given = string.downcase.chars.sort
      results << string if word_given == string_given && @word.downcase != string.downcase
    end

    results
  end
end

# a = Anagram.new('listen')
# a.match(%w(enlists google inlets banana))