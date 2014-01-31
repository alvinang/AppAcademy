require 'debugger'
# Implement new Array methods my_each, my_map, my_select. Do it by
# monkey-patching the Array class. Don't use any of the original versions when
# writing these. You can use my_each to define the others.

# each takes ever element and pass it to a block
class Array
  def my_each(&blk)
    self.length.times do |el|
      blk.call(self[el])
    end    
    self
  end

  def my_map(&blk)
    [].tap do |result|
      self.my_each do |el|
        blk.call(el)
      end
    end
  end

  def my_select(&blk)
    [].tap do |result|
      self.my_each do |el|
        result << el if blk.call(el)
      end
    end
  end
end


######################################################
# Implement a my_inject method. Your version shouldn't take an optional
# starting argument; just use the first element. Ruby's inject is fancy (you
# can write [1, 2, 3].inject(:+) to shorten up [1, 2, 3].inject { |sum, num|
# sum + num }), but do the block (and not the symbol) version.

# [1,2,3].inject { |sum, num| sum + num }
#

class Array
  def my_inject(&blk)
    sum = self[0]
    self[1..-1].my_each do |num|
      sum = blk.call(sum, num)
    end
    sum
  end
end

######################################################
# Define your own Array#my_sort! (you don't need my_each anymore). It should take in a block to perform the comparison:
#
# [1, 3, 5].my_sort! { |num1, num2| num1 <=> num2 } #sort ascending
# [1, 3, 5].my_sort! { |num1, num2| num2 <=> num1 } #sort descending
# #<=> (the spaceship method) compares objects. x.<=>(y) returns -1 if x is less than y. If x and y are equal, it returns 0. If greater, 1. You can define <=> on your own classes.

class Array
  def my_sort!(&blk)

    sorted = self.dup
    check_sort = false

    until check_sort
      check_sort = true
      
      index = 0
      while index < (sorted.length - 1)
        case blk.call(sorted[index], sorted[index + 1])
        when 1
          sorted[index], sorted[index + 1] = sorted[index + 1], sorted[index]
          check_sort = false
        end
        index += 1
      end
    end

    sorted
  end
end

######################################################
# Write an eval_block method that takes some arguments and a block. (Note: this
# method is not part of the Array class; just write a stand-alone method.) It
# should call the block, passing all the arguments to the block at once
# (individually, not as an array) using the splat operator. If the user doesn't
# supply the block, it should print out "NO BLOCK GIVEN!".
# To take possibly multiple arguments, check out the Ruby splat operator.

def eval_block (*arguments, &blk)
  blk.nil? ? puts 'NO BLOCK GIVEN' : blk.call(*arguments)
end

# Example calls to eval_block
#eval_block("Kerry", "Washington", 23) do |*args|
#  first_name = args[0]
#  last_name = args[1]
#  score = args[2]
#  puts "#{ last_name }, #{ first_name } won #{ score } votes."
#end
# => Washington, Kerry won 23 votes.

#eval_block(1,2,3,4,5) do |*args|
#  p args.inject(:+)
#end
# => 15