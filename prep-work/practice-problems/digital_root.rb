# Write a method, `digital_root(num)`. It should Sum the digits of a
# positive integer. If it is greater than 10, sum the digits of the
# resulting number.  Keep repeating until there is only one digit in
# the result, called the "digital root". **Do not use string
# conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)`
# which performs one step of the process.
#describe "#digital_root" do
#  it "works for a single digit" do
#    digital_root(9).should == 9
#  end
#
#  it "works for a longer number" do
#    digital_root(4322).should == 2
#  end
#end

def digital_root(num)
    until num < 10
        num = digital_root_step(num)
    end
    num
end



def digital_root_step(num) # take the last number and dump them into an array
    digits = []    
    answer = 0
    
    until num == 0
        digits << (num % 10)
        num = num / 10
    end
    
    digits.each do |result| # OR digits.inject(:+)
        answer += result
    end
    answer
end