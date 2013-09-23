# Write a function, `no_repeats(year_start, year_end)`, which takes a
# range of years and outputs those years which do not have any
# repeated digits.
#
# You should probably write a helper function, `no_repeat?(year)` which
# returns true/false if a singe year doesn't have a repeat.
#
# Difficulty: 1/5

def no_repeats(year_start, year_end)

	year = year_start
	results = []

	while year <= year_end
		results << year if no_repeat?(year)
		year += 1
	end

	results
end



def no_repeat?(year)

	year_arr = year.to_s.split("")

	year_arr.uniq.count == 4 ? true : false
	
end




# def no_repeats(year_start, year_end)

# 	year_to_check = year_start
# 	result = []

# 	while year_to_check <= year_end		
# 		good = no_repeat?(year_to_check)
# 		result << year_to_check if good
# 		year_to_check += 1
# 	end

# 	result
# end

# def no_repeat?(year)

# 	arr = year.to_s.each_char.to_a
# 	no_repeat_length = arr.uniq.length  
# 	no_repeat_length == 4 ? true : false	

# end

# def no_repeats(year_start, year_end)
# 	# if true, output. if false, ignore.
# 	no_repeat_year = []
# 	year = year_start

# 	while year <= year_end
# 		no_repeat_year << year if no_repeat?(year)
# 		year += 1
# 	end
# 	no_repeat_year
# end



# def no_repeat?(year)
# 	# return true/false if single year doesn't have repeat
# 	# input year, convert to string, split
# 	year_to_check = year.to_s.split("")

# 	# if .uniq.length == input, true
# 	year_to_check.uniq.length == 4 ? true : false
	
# end