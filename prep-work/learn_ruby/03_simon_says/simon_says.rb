def echo(string)
  string
end


def shout(string)
  string.upcase
end


def repeat(string, num = 2)
  
  if num <= 0
    puts "Please enter a positive number to repeat"
  elsif num == 1
    puts string
  else
    ((string + " ") * (num - 1)) + string
  end

end


def start_of_word(string, num)

  puts "Please enter number larger than 0" if num <= 0

  if num == 1
    string[0]
  else
    string[0..(num-1)]
  end
  
end


def first_word(string)

  word_array = string.split(" ")
  first = word_array.first
  
end


def titleize(string)

  string_array = string.split
  little_words = ["and", "over", "the", "or", "is", "to"]
  result = []
  
  string_array.each_with_index do |word, index|
    if index == 0
      result << word.capitalize 
    elsif little_words.include?(word)
      result << word
    else
    result << word.capitalize
    end
  end

  result.join(" ")
end