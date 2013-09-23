# 1. find vowel's index
# 2. if start with vowel, add "ay" to the back
# 3. else, move everything before vowel to the back and add "ay"
# 4. Create 2 method. One to process word, one to break words into pieces

def translate(string)

  string_array = string.split
  result = []

  string_array.each do |word|
    result << translate_processor(word)
  end
  
  result.join(" ").to_s
end


def translate_processor(string)
  # checks for capitalization
  n = 1 if string.capitalize == string

  # checks for punctuation
  punctuation = string.index(/[\.|\,|\!|\?]/)
  punctuation.nil? ? (length_index = string.length - 1) : (length_index = string.length - 2)

  # checks for "qu"
  qu_last_index = string.rindex(/[qu]/) # uses regex to find index for "u" if qu exist
  first_vowel_index = string.index(/[aeiou]/)

  # run processor
  if first_vowel_index == 0 || first_vowel_index.nil?
    result = string + "ay"
  elsif qu_last_index
    result = string[(qu_last_index + 1)..length_index] + string[0..qu_last_index] + "ay"
  else
    result = string[first_vowel_index..length_index] + string[0..(first_vowel_index-1)] + "ay"
  end

  # modify results if capitalization or punctuation occurs
  result = result.downcase.capitalize if n == 1
  result = result + string[punctuation] unless punctuation.nil?
  result

end