# Write a function, `nearest_larger(arr, i)` which takes an array and an
# index.  The function should return another index, `j`: this should
# satisfy:
#
# (a) `arr[i] < arr[j]`, AND
# (b) there is no `j2` closer to `i` than `j` where `arr[i] < arr[j]`.
#
# In case of ties (see example beow), choose the earliest (left-most)
# of the two indices. If no number in `arr` is largr than `arr[i]`,
# return `nil`.
#
# Difficulty: 2/5

def nearest_larger(arr, i)

	diff = 1
	loop do
		left = i - diff
		right = i + diff

		if (left >= 0) && (arr[left] > arr[i]) 
			return left
		elsif (right < arr.length) && (arr[right] > arr[i])
			return right
		elsif (left < 0) && (right >= arr.length)
			return nil
		elsif (arr[i] == arr.sort[(arr.length - 1)])
			return nil		
		end
		diff += 1
	end
end



# Method 1: Use Test Driven Development
# Assumption, nearest means within +-2
# nearest_larger divides into two methods. If array is more than 5, we slice it first.
# def nearest_larger(arr, idx)
# 	arr_length = arr.length
	
# 	if arr_length > 5
# 		new_arr = arr.slice((idx-2), 5)
# 		new_idx = 2
# 		j = nearest_larger_processor(new_arr,new_idx)

# 		if j 
# 			j = nearest_larger_processor(new_arr,new_idx).to_i + idx - 2
# 		else 
# 			j = nil
# 		end	
# 	else 		
# 		j = nearest_larger_processor(arr,idx)

# 		unless j 
# 			j = nil
# 		end
# 	end

# 	j	
# end

# def nearest_larger_processor(arr,idx)
	
# 	value_to_compare = arr[idx]
# 	arr_sorted = {}
# 	arr_sorted = arr.sort
# 	idx_arr_sorted = arr_sorted.index(value_to_compare)

# 	if arr_sorted.last == value_to_compare
# 		p = false
# 	elsif arr[(idx - 1)] == arr[(idx + 1)] || (arr[(idx - 1)] > value_to_compare && arr[(idx + 1)] > value_to_compare)
# 		p = idx - 1
# 	else 
# 		p = arr.index(arr_sorted.last)
# 	end
# 	p
# end
# def nearest_larger(arr, i)

# 	idx = 1

# 	#loop
# 	loop do 

# 		left = i - idx
# 		right = i + idx
		
# 		# elsif left == right & largest, left || left & right > i, left
# 		if (left >= 0) && (arr[left] > arr[i])
# 			return left 


# 		# simple case
# 		elsif (right < arr.length) && (arr[right] > arr[i])
# 			return right 

# 		# if largest, return nil
# 		elsif (left < 0) && (right >= arr.length)
# 			return nil

# 		end

# 		idx += 1
# 	end

# end