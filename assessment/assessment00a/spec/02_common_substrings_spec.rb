require '02_common_substrings'
require 'rspec'

# Write a function, `common_substrings(str1, str2)` that takes two
# strings and returns the longest common substring.
#
# NB: You may wish to use `String#include?`. To pull out a substring
# given a range, use `str[start..end]`.

#    e.g. common_substrings(
describe "#common_substrings" do
  it "finds a common substring" do
    common_substrings("zooglensnuck", "lenscrafters").should == "lens"
  end

  it "returns empty string if no common substring" do
    common_substrings("abc", "xyz").should == ""
  end
end
