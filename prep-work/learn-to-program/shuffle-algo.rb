# 1. take random value in array
# 2. store in a different array
# 3. condition: not the same as array


def shuffle(array)
		
	shuffled = []

	while array.length > 0
		random_value = array.sample
		array = array - [random_value]
		shuffled << random_value
	end

	if shuffled == array || shuffled == array.sort
		shuffle(array)
	end

	puts shuffled

end

shuffle([3,2,5,2,3,2,1,5,6,87,423])