# bubble sort is great but quick sort is faster. See folder "learn-to-program" for quicksort algorithm

def bubble_sort(arr)
	sorted = false
	until sorted
		sorted = true
		(arr.count - 1).times do |i|
			if arr[i] > arr[i + 1]
				arr[i], arr[i + 1] = arr[i + 1], arr[i]
				sorted = false
			end
		end
	end
	arr

end
