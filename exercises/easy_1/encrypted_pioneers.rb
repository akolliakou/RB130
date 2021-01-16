# The following list contains the names of individuals who are pioneers in
# the field of computing or that have had a significant influence on the field.
# The names are in an encrypted form, though, using a simple (and incredibly
# weak) form of encryption called Rot13.

NAMES = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
]

ALPHABET_UPPER = ('A'..'Z').to_a + ('A'..'Z').to_a
ALPHABET_LOWER = ('a'..'z').to_a + ('a'..'z').to_a

def decrypt(arr)
  arr.map do |str|
    str.split.map do |word|
      word.chars.map do |char|
        decipher_char(char)
      end.join
    end.join(' ')
  end
end

def decipher_char(char)
  if char =~ /[^a-zA-Z]/
    char
  elsif char == char.upcase
    ALPHABET_UPPER[ALPHABET_UPPER.index(char) - 13]
  else
    ALPHABET_LOWER[ALPHABET_LOWER.index(char) - 13]
  end
end


decrypt(NAMES)