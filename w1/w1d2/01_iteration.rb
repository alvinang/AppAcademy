# Write a loop the finds the first number that is (a) >250 and (b) divisible by 7. Print this number down!
def find_number

  # iterator_num = 7

  iterator_num = 245
  while ( iterator_num < 250 )
    iterator_num += 7
  end
  iterator_num
end

############################################################
# Write a method factors that prints out all the factors of a given number.

def factors number

  return number if number < 2

  factor_array = [1]
  upper_bound = (number ** 0.5).to_i

  (2..upper_bound).each do |possible_factor|

    if number % possible_factor == 0
      factor_array << possible_factor
      factor_array << number / possible_factor
    end
  end

  factor_array.uniq.sort
end

############################################################
# Implement Bubble sort in a method #bubble_sort that takes an Array and modifies it so that it is in sorted order.

# non recursive method
class Array
  def bubble_sort

    sorted = false
    final_array = self

    until sorted
      changed = false

      (final_array.length - 1).times do |index|
        if final_array[index] > final_array[index+1] 
          final_array[index], final_array[index+1] = final_array[index+1], final_array[index]
          changed = true
        end
      end

      sorted = true if changed == false
    end

    final_array
  end
end


############################################################
# Write a method substrings that will take a String and return an array containing each 
# of its substrings. Don't repeat substrings. Example output: substrings("cat") => ["c", "ca", "cat", "a", "at", "t"].


def substrings(string)
  substring = []

  string.size.times do |first|
    first.upto (string.size - 1) do |second|
      sub = string[first..second]
      substring << sub unless substring.include? (sub)
    end
  end
  substring
end

############################################################
# Your substrings method returns many strings that are not true English words. Let's write a new method, 
# subwords which will call substrings, but then filter it and return just the English words.

def subwords(string)
  dictionary = []
  # or can use dictionry = File.foreach('dictionary.txt').map(&:chomp)
  File.foreach('dictionary.txt') do |f|
    dictionary << f.chomp
  end
  substrings(string).select { |word| dictionary.include? word }

end