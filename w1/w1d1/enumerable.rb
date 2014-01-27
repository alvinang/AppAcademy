# enumerable.rb

# Write a method that takes an array of integers and returns an array with the array elements multiplied by two.

# def multiply_by_two(array)
#   array.map { |n| n * 2 }
# end

###########################################################################

# Extend the Array class to include a method named my_each that takes a block, calls the block on every element of the array, and then returns the original array. Do not use Ruby's Enumerable's each method. I want to be able to write:
#
# # calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
# # => 1
#      2
#      3
#      1
#      2
#      3
#
# p return_value # => [1, 2, 3]

# class Array
#   def my_each
#     self.size.times { |n| puts self[n] }
#   end
# end

###########################################################################

# Write a method that finds the median of a given array of integers. If the array has an odd number of integers,
# return the middle item from the sorted array. If the array has an even number of integers, return the average
# of the middle two items from the sorted array. (This one might not use any enumerable methods?)

# def median(array)
#   array_size = array.size
#   midpoint = array_size / 2
#
#   if array_size.odd?
#     median = array[midpoint]
#   else
#     median = (array[midpoint] + array[midpoint - 1]) / 2.0
#   end
#   median
# end


###########################################################################

# Create a method that takes in an Array of Strings and uses inject to return the concatenation of the strings.
#
# concatenate(["Yay ", "for ", "strings!"])
# # => "Yay for strings!"

# def concatenate(array)
#   array.inject(:+)
# end






