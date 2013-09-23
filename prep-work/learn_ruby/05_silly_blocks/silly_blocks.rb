def reverser
  yield.gsub(/\w+/) { |w| w.reverse}
end


def adder(num = 1)
  yield + num
end

# in this code block, (num) is represented by "n". The value of "n" will be replaced in "yield".
def repeater(n = 1)
  n.times { yield }
end