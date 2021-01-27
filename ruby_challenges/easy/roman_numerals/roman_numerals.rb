# The Romans were a clever bunch. They conquered most of Europe and 
# ruled it for hundreds of years. They invented concrete and straight 
# roads and even bikinis. One thing they never discovered though was 
# the number zero. This made writing and dating extensive histories of 
# their exploits slightly more challenging, but the system of numbers 
# they came up with is still in use today. For example the BBC uses Roman 
# numerals to date their programmes.

# The Romans wrote numbers using letters - I, V, X, L, C, D, M. (notice 
# these letters have lots of straight lines and are hence easy to hack 
# into stone tablets).

# Copy Code
#  1  => I
# 10  => X
#  7  => VII
# There is no need to be able to convert numbers larger than about 
# 3000. (The Romans themselves didn't tend to go any higher)

# Wikipedia says: Modern Roman numerals ... are written by expressing each digit separately starting with the left most digit and skipping any digit with a value of zero.

# To see this in practice, consider the example of 1990. In Roman numerals 1990 is MCMXC:

# 1000=M
# 900=CM
# 90=XC
# 2008 is written as MMVIII:

# 2000=MM
# 8=VIII

ONES = { 0 => '', 1 => 'I', 2 => 'II', 3 => 'III', 4 => 'IV', 5 => 'V', 
         6 => 'VI', 7 => 'VII', 8 => 'VIII', 9 => 'IX'
       }
TENS = { 0 => '', 1 => 'X', 2 => 'XX', 3 => 'XXX', 4 => 'XL',
         5 => 'L', 6 => 'LX', 7 => 'LXX',
         8 => 'LXXX', 9 => 'XC'
       }
HUNDREDS = { 0 => '', 1 => 'C', 2 => 'CC', 3 => 'CCC', 4 => 'CD',
             5 => 'D', 6 => 'DL', 7 => 'DLL',
             8 => 'DLLL', 9 => 'CM'
           }
THOUSANDS = { 0 => '', 1 => 'M', 2 => 'MM', 3 => 'MMM' }

class Integer
  def to_roman
    digits = self.digits

    string = ''

    string.prepend(ONES[digits[0]]) if digits[0]
    string.prepend(TENS[digits[1]]) if digits[1]
    string.prepend(HUNDREDS[digits[2]]) if digits[2]
    string.prepend(THOUSANDS[digits[3]]) if digits[3]

    string
  end
end


