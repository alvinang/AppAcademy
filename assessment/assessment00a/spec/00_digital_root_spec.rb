require '00_digital_root'
require 'rspec'

# Write a method, `digital_root(num)`. It should Sum the digits of a
# positive integer. If it is greater than 10, sum the digits of the
# resulting number.  Keep repeating until there is only one digit in
# the result, called the "digital root". **Do not use string
# conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)`
# which performs one step of the process.
describe "#digital_root" do
  it "works for a single digit" do
    digital_root(9).should == 9
  end

  it "works for a longer number" do
    digital_root(4322).should == 2
  end
end
