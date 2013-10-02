# Take number
# determine one, two or three numbers
# process and output word

def english_number(number)
	if number < 0
		puts "Please enter a positive number"
	elsif number == 0
		return "zero"
	end

	result = ""

	one = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
	tens = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
	teens = ["eleven", "twelve", "thirteen", "forteen", "fifteen", "sixteen", "seventeen", "eighteen", "ninteen"]	
	larger = [["hundred", 2], ["thousand", 3], ["million", 6], ["billion", 9], ["trillion", 12], ["quadrillion", 15] ,["quintillion", 18], ["sextillion", 21], ["octillion", 24], ["nonillion", 27], ["decillion", 30], ["undecillion", 33]]
	
	left = number

	while larger.length > 0
		large_number = larger.pop
		large_divisor = 10 ** large_number[1]
		write = left / large_divisor
		left = left - (write * large_divisor)

		if write > 0		
			prefix = english_number(write)
			result = result + prefix + " " + large_number[0]
			if left > 0
				result = result + " "
			end
		end
	end

	write = left / 10
	left = left - (write * 10)

	if write > 0
		if (write == 1) && left > 0
			result = result + teens[left - 1]
			left = 0
		else
			result = result + tens[write - 1] + " "
		end
	end

	write = left
	left = 0

	if write > 0
		result = result + one[write - 1]
	end

	result
end

def beer_song(num)
	while num >= 0
		puts "#{english_number(num)} Bottles of Beer on the Wall"
		num -= 1
	end	
end

puts beer_song(99999)

