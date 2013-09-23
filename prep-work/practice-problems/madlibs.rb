# Create hash with content in (()). Loop to get content in (()) using regex. Replace & output

def madlibs(template)

	to_replace = {}
	to_substitute = template.scan(/\(\(.*?\)\)/)

	to_substitute.each do |word|
		puts "Enter the first word that comes to your mind when you think of \"#{word.delete('()')}\"? "
		user_input = gets.chomp
		to_replace[word] = user_input
	end

	to_replace.each do |key, value|
		template.gsub!(key, value)
	end

	template
end


# def madlibs(template) #input string
	
# 	to_replace = {}
# 	words = template.split(" ")
# 	words.each_with_index do |word, index|
		
# 		if word.start_with?("((")
# 			word.sub(/\(\(.*?\)\)/) { |word| to_replace[index] = word }		
# 		end

# 		if 

# 	end
	
# end