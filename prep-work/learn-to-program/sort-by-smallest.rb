# Sort an array of input
# 1. pop value from array
# 2. compare to find the smallest
# 3. run recursion

def sorted(array)
	sort(array, [])
end

def sort(array, sorted)

	if array.length <= 0
		return sorted
	end

	smallest_value = array.pop
	unsorted = []

	array.each do |value_in_array|
		if value_in_array < smallest_value
			unsorted.push smallest_value
			smallest_value = value_in_array
		else
			unsorted.push value_in_array
		end		
	end

	sorted.push smallest_value

	sort(unsorted, sorted)	
	
	
end

puts sorted([1,4,3,5,1,2])