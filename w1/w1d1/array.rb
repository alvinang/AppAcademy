# # array.rb
#
# Remove dups
#
# Array has a uniq method that removes duplicates from an array. It returns the unique elements in the order in which they first appeared:
#
# [1, 2, 1, 3, 3].uniq # => [1, 2, 3]
# Write your own uniq method, called my_uniq; it should take in an Array and return a new array.
#
# One special feature of Ruby classes is that they are open; we can add new methods to existing classes. Here, add your my_uniq method to Array:
#
# class Array
#   def my_uniq
    # ...
#   end
# end
# This is called monkey patching.

# class Array
#   def my_uniq
#     # use include? to get uniq array
#     result = []
#     self.each { |n| result << n unless result.include?(n) }
#     result
#   end
# end

################################################################################################
# Two sum
#
# Write a new Array#two_sum method that finds all pairs of positions where the elements at those positions sum to zero.
#
# NB: ordering matters. I want each of the pairs to be sorted smaller index before bigger index. I want the array of pairs to be sorted "dictionary-wise":
#
# [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]
# [0, 2] before [2, 1] (smaller first elements come first)
# [0, 1] before [0, 2] (then smaller second elements come first)
#
# class Array
#   def two_sum
#     result = []
#     #loop through array once, 2nd loop to compare, then check. avoid same index.
#     self.size.times do |n|
#       (n + 1).upto (self.size - 1) do |i|
#         result << [n, i] if (self[n] + self[i] == 0)
#       end
#     end
#     result
#
#   end
# end



################################################################################################

# My Transpose
#
# To represent a matrix, or two-dimensional grid of numbers, we can write an array containing arrays which represent rows:
#
# rows = [
#     [0, 1, 2],
#     [3, 4, 5],
#     [6, 7, 8]
#   ]
#
# row1 = rows[0]
# row2 = rows[1]
# row3 = rows[2]
# We could equivalently have stored the matrix as an array of columns:
#
# cols = [
#     [0, 3, 6],
#     [1, 4, 7],
#     [2, 5, 8]
#   ]
# Write a method, my_transpose, which will convert between the row-oriented and column-oriented representations. You may assume square matrices for simplicity's sake.

# class Array
#   def my_transpose
#     result = Array.new(self.size) {[]}
#
#     self.size.times do |n|
#       self.size.times do |i|
#         result[i][n] = self[n][i]
#       end
#     end
#     result
#   end
# end


################################################################################################

# Stock Picker
#
# Write a method that takes an array of stock prices (prices on days 0, 1, ...), and
# outputs the most profitable pair of days on which to first buy the stock and then sell the stock.

# def stock_picker(array)
#   # loop through array twice. Once to take value, 2nd to compare, store index into result
#   result = []
#   profit, buy_day, sell_day = 0, 0, 0
#
#   array.size.times do |n|
#     (n + 1).upto (array.size - 1) do |i|
#       if (array[n] - array[i]) > profit
#         profit = array[n] - array[i]
#         buy_day = n
#         sell_day = i
#       end
#     end
#   end
#   [buy_day, sell_day]
# end





















