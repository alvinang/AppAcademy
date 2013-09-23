# Write a function, `letter_count(str)` that takes a string and
# returns a hash mapping each letter to its frequency. Do not include
# spaces.
#
# Difficulty: 1/5


def letter_count(str)

	arr = str.gsub(/ /, "").split("")
	hash = Hash.new{0}
	arr.each do |n| 
		hash[n] += 1
	end
	hash

end






# def letter_count(str)
	
# 	str = str.gsub(/ /, '') # or can use compact on arr
# 	arr = str.each_char.map{ |n| n }
# 	frequencies = Hash.new(0)
# 	arr.each { |key| frequencies[key] += 1 } 
# 	frequencies
	
# end
