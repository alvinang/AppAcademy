# Write a method, `ordered_vowel_words(str)` that takes a string of
# lowercase words and returns a string with just the words containing
# all their vowels (excluding "y") in alphabetical order. Vowels may
# be repeated (`"afoot"` is an ordered vowel word).
#
# You will probably want a helper method, `ordered_vowel_word?(word)`
# which returns true/false if a word's vowels are ordered.
#
# Difficulty: 2/5



def ordered_vowel_words(str)

	arr_str = str.split(" ")
	
end

def ordered_vowel_word?(word)

	word_arr = word.split("")
	vowels = word_arr.select { |n| n=~ /aeiou/}

	if vowels.empty? || vowels.length == 1
		return true
	else
		return (vowels == vowels.sort ? true : false)
	end

end



def ordered_vowel_words(str)
	
	arr_str = str.split # case for > 1 word
	if arr_str.length == 1
		answer = ordered_vowel_word?(arr_str.to_s) == true ? str : ""		
	else
		answer_arr = []
		arr_str.each {|s| answer_arr << s if ordered_vowel_word?(s.to_s) == true }
		answer = answer_arr.join(" ") # answer has to be one string
	end
	answer
end

def ordered_vowel_word?(word)

	word_arr = word.each_char.map{|n| n}
	vowels = word_arr.select { |n| n =~ /[aeiou]/}

	if vowels.empty? || vowels.length == 1
		result = true
	else
		result = (vowels == vowels.sort ? true : false)
	end
	result
end