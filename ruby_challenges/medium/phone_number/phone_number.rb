# Write a program that cleans up user-entered phone numbers so that 
# they can be sent as SMS messages.

# The rules are as follows:

# - If the phone number is less than 10 digits assume that it is bad number
# - If the phone number is 10 digits assume that it is good
# - If the phone number is 11 digits and the first number is 1, trim the 
# 1 and use the last 10 digits
# - If the phone number is 11 digits and the first number is not 1, then 
# it is a bad number
# - If the phone number is more than 11 digits assume that it is a bad 
# number

class PhoneNumber
  attr_reader :str

  def initialize(str)
    @str = str.chars.delete_if { |char| char =~ /[^a-zA-Z0-9]/ }.join
  end

  def number
    if str_size_ten?
      str
    elsif str_size_eleven?
      str[1..-1]
    else
      '0000000000'
    end
  end

  def area_code
    str[0..2]
  end

  def to_s
    if str.size == 11
      "(#{str[1..3]}) #{str[4..6]}-#{str[7..10]}"
    else
      "(#{str[0..2]}) #{str[3..5]}-#{str[6..9]}"
    end
  end

  private

  def str_size_ten?
    str.size == 10 && all_digits?
  end

  def str_size_eleven?
    str.size == 11 && all_digits? && with_one?
  end

  def all_digits?
    str.chars.all? { |char| char =~ /[0-9]/ }
  end

  def with_one?
    str.size == 11 && str[0] == '1'
  end
end
