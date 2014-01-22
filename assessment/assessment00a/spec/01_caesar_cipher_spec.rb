require '01_caesar_cipher'
require 'rspec'

# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and
# incrementing it by a fixed number, so "abc" by 2 would look like
# "cde", wrapping around back to "a" when you pass "z".  Write a
# function, `caesar_cipher(str, shift)` which will take a message and
# an increment amount and outputs the encoded message.  Assume
# lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use
# `("a".."z").to_a`. To find the position of a letter in the array,
# you may use `Array#find_index`.

describe "#caesar_cipher" do
  it "encodes a simple word" do
    caesar_cipher("aaa", 11).should == "lll"
  end

  it "wraps around" do
    caesar_cipher("zzz", 1).should == "aaa"
  end

  it "encodes multiple word" do
    caesar_cipher("catz hatz", 2).should == "ecvb jcvb"
  end
end
