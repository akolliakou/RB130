# Consider a character set consisting of letters, a space and a point. Words consist 
# of one or more, but at most 20 letters. An input text consists of one or more words
# separated from each other byone or more spaces and terminated by 0 or more spaces
# followed by a point. Input should be read from, and including, the first letter of the
# first word, up to and including the terminating point. The output text is to be produced
# such that successive words are separated by a single space with the last word being 
# terminated by a single point. Odd words are copied in reverse order while even words
# are merely echoed.

def reverse_odd_words(text)
  clean_str = text.squeeze(" ").delete(".").strip

  if text[-1] == '.'
    reverse_word(clean_str) << '.'
  else
    reverse_word(clean_str)
  end
end

def reverse_word(string)
  results = []

  string.split.each_with_index do |word, idx|
    idx.odd? ? results << word.chars.reverse.join : results << word
  end

  results.join(' ')
end

p reverse_odd_words("hello")
p reverse_odd_words("hello word.")
p reverse_odd_words("hello word .")
p reverse_odd_words("hello  word .")
p reverse_odd_words("hello word  .")
p reverse_odd_words("hello word world .")