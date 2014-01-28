# string.rb

# Your own to_s method
#
# In this exercise, you will define a method num_to_s(num, base), which will return a string representing the original number in a different base (up to base 16).
#
# To refresh your memory, a few common base systems:
#
# Base 10 (decimal)  0  1  2  3  ...  9  10  11  12  13  14  15
# Base 2 (binary)  0  1  10  11  ...  1001  1010  1011  1100  1101  1110  1111
# Base 16 (hexadecimal)  0  1  2  3  ...  9  A  B  C  D  E  F
# Examples of strings num_to_s(num, base) should produce:
#
# num_to_s(5, 10) #=> "5"
# num_to_s(5, 2)  #=> "101"
# num_to_s(5, 16) #=> "5"
#
# num_to_s(234, 10) #=> "234"
# num_to_s(234, 2)  #=> "11101010"
# num_to_s(234, 16) #=> "EA"
# Here's a more concrete example of how your method might arrive at the conversions above:
#
# num_to_s(234, 10) #=> "234"
# (234 / 1)   % 10  #=> 4
# (234 / 10)  % 10  #=> 3
# (234 / 100) % 10  #=> 2
#                       ^
#
# num_to_s(234, 2) #=> "11101010"
# (234 / 1)   % 2  #=> 0
# (234 / 2)   % 2  #=> 1
# (234 / 4)   % 2  #=> 0
# (234 / 8)   % 2  #=> 1
# (234 / 16)  % 2  #=> 0
# (234 / 32)  % 2  #=> 1
# (234 / 64)  % 2  #=> 1
# (234 / 128) % 2  #=> 1
#                      ^


def num_to_s(num, base)
  return 0 if num == 0
  # create hash for digits and characters
  characters = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F']
  result = []
  division = 1

  while num > division
    result << characters[(num/division) % base]
    division = division * base
  end

  result.reverse.join("")

end



##########################################################################################

# Caesar cipher
#
# Implement a Caesar cipher. Example: caesar("hello", 3) # => "khoor"
# Assume the text is all lower case letters.
# You'll probably want to map letters to numbers (so you can shift them). You could do this mapping yourself, but you will want to use the ASCII codes, which are accessible through String#ord or String#each_byte. To convert back from an ASCII code number to a character, use Fixnum#chr.
# Important point: ASCII codes are all consecutive!
# In particular, "b".ord - "a".ord == 1.
# Lastly, be careful of the letters at the end of the alphabet, like "z"!


def caesar(string, num)
  result = []
  answer = []

  #remove "a" ordinal value
  string.each_byte { |c| result << ((c.to_i) - 96 + num) }

  #add num and modulus 26 incase of "z"
  result.map { |i| ((i % 26) + 96).chr }.join("")

end
























