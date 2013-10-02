# Write a function, `common_substrings(str1, str2)` that takes two
# strings and returns the longest common substring.
#
# NB: You may wish to use `String#include?`. To pull out a substring
# given a range, use `str[start..end]`.

##    e.g. common_substrings(
#describe "#common_substrings" do
#  it "finds a common substring" do
#    common_substrings("zooglensnuck", "lenscrafters").should == "lens"
#  end
#
#  it "returns empty string if no common substring" do
#    common_substrings("abc", "xyz").should == ""
#  end
#end

def common_substrings(str1, str2)
    length1 = str1.length
    str1_array = str1.chars
    check_array = []
    result = []
    
    # get all consecutive combination of string
    (3..length1).each do |x|
        str1_array.each_cons(x) { |word| check_array << word.join }
    end
    
    # check all combination if include in str2
    check_array.each do |to_check|
        result << to_check if str2.include? to_check
    end
    # we only want the longest common substring
    result.max_by(&:length)

end

# OR

def common_substrings(str1, str2)
    subs1 = []
    (1..str1.length).each do |length|
        str1.split("").each_cons(length) do |group|
            subs1 << group
        end
    end
    
    subs2 = []
    (1..str2.length).each do |length|
        str2.split("").each_cons(length) do |group|
            subs2 << group
        end
    end
    
    substring = (subs1 & subs2).max_by { |x| x.length }
    substring.empty? ? "" : substring

end