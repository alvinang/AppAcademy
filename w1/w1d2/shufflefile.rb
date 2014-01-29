# Write a program that prompts the user for a file name, reads that file, shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You could create a random number using the Random class, or you could use the shuffle method in array. This exercise is under 05_classes

class Shuffler
  def shuffle_file filename
    shuffled_file = []

    File.foreach(filename) do |f|
      shuffled_file << f.chomp
    end
    save_file shuffled_file.shuffle!, filename

  end

  def save_file array, source_filename
    # removes the extension
    filename = source_filename.sub(/\.\w*$/,'')

    shuffled_name = "#{filename}-shuffled.txt"
    File.open(shuffled_name, 'w') do |f|
      array.each do |line|
        f.puts line
      end
    end

  end

  def demand_filename
    puts "Give me a filename! or else.."
    filename = gets.chomp

    shuffle_file filename
  end
end


# significantly shorter way
def shuffle filename
  File.open("#{filename}-shuffle.txt") do |f|
    File.foreach(filename) do |line|
      f.puts line.chomp
    end
  end
end