# Write a function, `fibs(num)` which returns a given number of
# elements from the fibonnacci sequence
# (http://en.wikipedia.org/wiki/Fibonacci_number). In the sequence,
# each next number is the sum of the two preceding numbers.

#describe "#fibs" do
#  it "returns the first fib" do
#    fibs(1).should == [0]
#  end
#
#  it "returns the first two fibs" do
#    fibs(2).should == [0, 1]
#  end
#
#  it "returns many fibs" do
#    fibs(7).should == [ 0, 1, 1, 2, 3, 5, 8 ]
#  end
#
#  it "returns no fibs" do
#    fibs(0).should == []
#  end
#end 
 
def fibs(num)
    result = []
    return [] if num == 0
    
    last_index = num - 1
    (0..last_index).each_with_index do |x, index|
        result << 0 if index == 0
        result << 1 if index == 1
        result << (result[index - 2] + result[index - 1]) if index >= 2
    end
    result
end
