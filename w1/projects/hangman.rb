class Hangman
  
  attr_reader :counter, :letter, :word
  
  def initialize(player, opponent)
    @word = []
    @letter = ""
    @player, @opponent = player, opponent
    @counter = 0
    @guessed_words = []
  end
  
  def won?
    true
    @word.each do |letter|
      return false if letter.nil?
    end
  end
  
  def receive_secret_length
    @opponent.secret_length
  end
  
  def get_guess
    @player.guess(@word)
  end
  
  def check_guess(letter)    
    letter_pos = @opponent.handle_guess_response(letter)
    if letter_pos.nil?
      @counter += 1
      return nil
    else
      letter_pos.each do |index|
        @word[index] = letter
      end
    end
    @word
  end
  
  def play
    word_length = receive_secret_length
    @word = Array.new(word_length)
    
    until won?
      @letter = get_guess
      if @guessed_words.include? @letter
        puts "#{@player.name} has already guessed #{@letter}..."
        puts ''
      else
        @guessed_words << @letter
        p check_guess(@letter)
        p @word    
        return "#{@player.name} lost..The answer is #{@opponent.provide_answer.upcase}" if @counter > 10  
        puts "Guessed letters: #{@guessed_words.join} " unless (@counter > 10 || won?)
        puts "#{10 - @counter} more guesses to go.."
        puts ''        
      end
      
    end
    
    puts "#{@player.name} won!"
  end
  
end

class HumanPlayer
  
  attr_reader :letter, :word, :name
  
  def initialize(name)
    @name = name
    @letter = ''
    @word = word
  end
  
  def guess(word)
    p word
    puts "Please provide a letter"
    @letter = gets.chomp.downcase
    if @letter.length > 1
      puts "One letter please!"
    end
    
    @letter
  end
  
  def pick_secret_word
    secret_length
  end
  
  def secret_length
    print "Please provide the secret length: "
    gets.chomp.to_i
  end
  
  def check_guess(letter)
    print "Does #{letter} exist in your word? (y or n): "
    gets.chomp == 'y' ? true : false
  end
  
  def handle_guess_response(letter)
    if check_guess(letter)
      puts "What is the position of the letter in the word? (start with 0)"
      return [gets.chomp.to_i]
    end
    
    nil
  end
  
  def provide_answer
    puts "We lost..what is the answer? "
    gets.chomp
  end
  
end

class ComputerPlayer
  
  attr_reader :word, :name
  
  def initialize(name = 'Computer Turd')
    @name = name
    @dictionary = []
    @word = ''
    @guessed_word = []
  end
  
  def dictionary
    File.foreach('dictionary.txt') { |line| @dictionary << line.chomp.strip }
  end
  
  def pick_secret_word
    dictionary
    @word = @dictionary.sample
  end
  
  def secret_length    
    pick_secret_word
    @word.length
  end
  
  def check_guess(letter) # letter is a string
    if @word.include? letter
      return @word.length.times.find_all { |index| @word[index, 1] if @word[index] == letter }  
    end
    nil
  end
  
  def handle_guess_response(letter)
    check_guess(letter)
  end
  
  def provide_answer
    @word
  end
  
  def guess(word)
    smart_ai(word.length)
    #('a'..'z').to_a.sample
  end
  
  def correct_guesses(word)
    [].tap do |correct_letters|
      word.each do |letter|
        next if letter.nil?
        correct_letters << letter
      end
    end
  end
  
  def smart_ai(word_length)
    word_hash = Hash.new(0)
    
    # select only words with the right length
    @words = @dictionary.select { |word| word.length == word_length }
    
    # process array to find most used words in that group
    @words.join(',').chars do |word|
      word_hash[word] += 1
    end.sort!
    
    return word_hash.keys.last unless @guessed_word.include? word_hash.keys.last  
  end
  
  # need to complete ai implementation
    
end

h = HumanPlayer.new('Alvin')
c = ComputerPlayer.new
game = Hangman.new(h, c)