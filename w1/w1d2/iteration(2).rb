def find_number

  # iterator_num = 7

  iterator_num = 245
  while ( iterator_num < 250 )
    iterator_num += 7
  end
  iterator_num
end


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


def bubble_sort given_array

  sorted = false
  final_array = given_array

  while !(sorted)
    changed = false

    (final_array.length - 1).times do |index|
      if final_array[index+1] < final_array[index]
        final_array[index+1], final_array[index] = final_array[index], final_array[index+1]
        changed = true
      end
    end

    sorted = true if changed == false
  end

  final_array
end


def substrings(string)
  substring = []

  string.size.times do |first|
    first.upto (string.size - 1) do |second|
      substring << string[first..second]
    end
  end
  substring
end

def subwords(string)
  dictionary = []
  File.foreach('dictionary.txt') do |f|
    dictionary << f.chomp
  end
  substrings(string).select { |word| dictionary.include? word }

end