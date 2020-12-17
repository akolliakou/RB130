# The following list contains the names of individuals who are pioneers in
# the field of computing or that have had a significant influence on the field.
# The names are in an encrypted form, though, using a simple (and incredibly
# weak) form of encryption called Rot13.

ALPHABET_DOWN = (("a".."z").to_a + ("a".."z").to_a)
ALPHABET_UP = (("A".."Z").to_a + ("A".."Z").to_a)

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
].freeze

def decrypt(arr)
  arr_final = arr.clone

  arr_final.map do |str|
    str.split.map do |word|
      word.chars.map do |char|
        if /[a-zA-Z]/.match(char)
          if char == char.downcase
            ALPHABET_DOWN[ALPHABET_DOWN.index(char) - 13]
          elsif char == char.upcase
            ALPHABET_UP[ALPHABET_UP.index(char) - 13]
          end
        else
          char
        end
      end.join
    end.join(' ')
  end
end


decrypt(NAMES)