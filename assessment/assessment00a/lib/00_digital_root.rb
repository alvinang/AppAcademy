# sends num to be processed by digital_root_step
def digital_root(num)	
	until num < 10
		num = digital_root_step(num)
	end

	num
end

# take number, extract last digit via modulus & add
def digital_root_step(num)
	num_array = []
	result = 0

	#use modulus to extract last digits & dump in array
	until num == 0
		num_array << (num % 10)
		num = num / 10
	end

	num_array.each { |n| result += n }
	result

end