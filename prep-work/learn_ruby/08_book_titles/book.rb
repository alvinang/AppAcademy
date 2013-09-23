class Book
	attr_accessor :title

	def title=(string)
		@title = titleize(string)		
	end

	def titleize(string)
		little_words = ["and", "over", "the", "or", "is", "to", "in", "of", "a", "on", "an"] # from 03_simon_says with addition from book titles
		string_array = string.capitalize.split
		result = []

		string_array.map do |word|			
			result << (little_words.include?(word) ? word : word.capitalize)
		end

		result.join(" ")
	end

end