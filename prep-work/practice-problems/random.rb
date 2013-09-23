# "Write a program that prints the numbers from 1 to 100. But for multiples of three print 
# “Fizz” instead of the number and for the multiples of five print “Buzz”. 
# For numbers which are multiples of both three and five print “FizzBuzz”."


num = 1

while num <= 100

	puts "FizzBuzz" if num % 15 == 0
	puts "Fizz" if num % 3 == 0
	puts "Buzz" if num % 5 == 0
	puts num

	num += 1
end