# recursion.rb

# Write a recursive method, range, that takes a start and an end and returns an
# array of all numbers between.

def range(start_range, end_range)
  return [start_range] if start_range == end_range

  range(start_range, end_range - 1 ) << end_range
end

