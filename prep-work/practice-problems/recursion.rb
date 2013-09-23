def recursion

	puts "Have you had lunch? "
	answer = gets.chomp

	if answer == "yes"
		puts "Good - stay healthy!"
	else
		recursion
	end
	
end