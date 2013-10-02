# if handling string, use n.downcase in select block

def quick_sort(array)
	return array if array.length <= 0

	middle = array.pop
	less = array.select { |n| n < middle }
	more = array.select { |n| n >= middle }

	quick_sort(less) + [middle] + quick_sort(more)	
end

puts quick_sort([4,32,5,1,3,6,2,3,4,2,2,5,6,7,2,4])