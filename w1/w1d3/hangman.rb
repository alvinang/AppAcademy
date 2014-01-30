# Create a hangman game
# Cases:
# 1. Computer generates word, plays with Human
# 2. Human generates word, plays with Computer
# 3. Computer uses AI to figure out best word
#
# During our first iteration for case 1, we used the initialized the following instead of @creator & @player
# @creator = ComputerPlayer.new
# @word_to_guess = @creator.secret_word
# @player = HumanPlayer.new
# Then, we iterate through and updated to @creator & @player to incorporate case 2 & ensure that computer & human are interchangeable

class Hangman
  
  attr_accessor :word_to_guess, :creator, :player, :hangman_array, :letters_guessed

  def initialize creator, player
    @creator, @player, @hangman_array, @letters_guessed = creator, player, [], []
  end

  def ask_secret_length
    self.creator.provide_secret_length
  end

  def create_hangman_array
    self.hangman_array = Array.new(self.ask_secret_length)
  end

  def play
    indices_from_player = []
    create_hangman_array

    until won?
      self.letters_guessed << self.player.guess(self.hangman_array)
      indices_from_player = self.creator.handle_guess_response(self.letters_guessed.last)

      unless indices_from_player.empty?
        indices_from_player.each do |index|
          self.hangman_array[index] = self.letters_guessed.last
        end
        self.letters_guessed.pop
      end
      
      p self.hangman_array.flatten
      return puts "You lose! The word was" if self.letters_guessed.length > 10
    end
    puts "You win"
  end

  def won?
    @hangman_array.none?{ |letter| letter.nil? }
  end
end


class HumanPlayer

  def guess hangman_array
    puts "Guess a letter dude.."
    gets.chomp
  end

  def provide_secret_length
    puts "Give how many letters are in your word!"
    gets.chomp.to_i
  end

  def handle_guess_response guess
    puts "Is #{guess} in your word? (y or n)"
    letter_available = gets.chomp

    if letter_available == "y"
      puts "What is the indices of the letter in the word? (i.e. 'n' in banana is: 2, 4)"
      correct_letter_index = gets.chomp.split(',').map(&:to_i)
    else
      []
    end
  end

end


class ComputerPlayer

  attr_accessor :dictionary, :guessed_letters, :smart_dictionary
  attr_reader :secret_word

  RANDOM_ARRAY = ("a".."z").to_a

  def initialize
    @dictionary, @guessed_letters, @secret_word = [], [], secret_word
    readfile_line
    @smart_dictionary = @dictionary
  end

  def readfile_line
    File.foreach('dictionary.txt') { |line| @dictionary << line.chomp }
  end

  def secret_words
    self.dictionary.sample(1)[0]
  end

  def provide_secret_length
    secret_word.length
  end

  def handle_guess_response guess
    temp_array = @secret_word.split('')
    temp_array.include? guess ? letter_location(guess) : []
  end

  def letter_location letter
    secret_word_split = @secret_word.split('')
    
    [].tap do |matched_array|
      secret_word_split.each_with_index do |secret_letter, index|
        matched_array << index if letter == secret_letter
      end
    end
    
  end

  def guess hangman_array
    #dumb_guess_ai
    smart_guess_ai(hangman_array)
  end

  def dumb_guess_ai
    random_letter = RANDOM_ARRAY.sample(1)
    while @guessed_letters.include? random_letter
      random_letter = RANDOM_ARRAY.sample(1)
    end

    @guessed_letters << random_letter
    @guessed_letters.last
  end

  def smart_guess_ai hangman_array

    @guessed_letters |= hangman_array
    self.smart_dictionary.select! { |word| word.length == hangman_array.length }

    hangman_array.each_with_index do |letter, index|
      next if letter.nil?
      self.smart_dictionary.delete_if do |dictionary_word|
        dictionary_word[index] != letter
      end
    end

    narrow_guess_words(smart_dictionary).last[0]
  end
  
  def narrow_guess_words smart_dictionary
    smart_dictionary_big_join = self.smart_dictionary.join('')

    smart_key_hash = Hash.new(0)
    smart_dictionary_big_join.split("").each do |key|
      smart_key_hash[key] += 1 unless @guessed_letters.include? key
    end
    
    smart_key_hash = smart_key_hash.sort_by { |_key, value| value }
    @guessed_letters << smart_key_hash.last[0]
    smart_key_hash
  end

end


if __FILE__ == $PROGRAM_NAME
  a = ComputerPlayer.new
  b = HumanPlayer.new
  g = Hangman.new(b,a)
  g.play
end

######################################################################################################################################
# Suggested solution by App Academy
# 
# class Hangman
#   MAX_TRIES = 10
# 
#   def initialize(guesser, referee)
#     @guesser, @referee = guesser, referee
#   end
# 
#   def play
#     secret_length = @referee.pick_secret_word 
#     @guesser.register_secret_length(secret_length)
#     @current_board = [nil] * secret_length
# 
#     MAX_TRIES.times do
#       take_turn
# 
#       if won?
#         p @current_board
#         puts "Guesser wins!"
#         return
#       end
#     end
# 
#     puts "Word was: #{@referee.require_secret}"
#     puts "Guesser loses!"
# 
#     nil
#   end
# 
#   private
#   def take_turn
#     guess = @guesser.guess(@current_board)
#     response = @referee.check_guess(guess)
#     update_board(guess, response)
# 
#     @guesser.handle_response(guess, response)
#   end
# 
#   def update_board(guess, indices)
#     indices.each { |index| @current_board[index] = guess }
#   end
# 
#   def won?
#     @current_board.all?
#   end
# end
# 
# class HumanPlayer
#   def register_secret_length(length)
#     puts "Secret is #{length} letters long"
#   end
# 
#   def guess(board)
#     p board
#     puts "Input guess:"
#     gets.chomp
#   end
# 
#   def handle_response(guess, response)
#     puts "Found #{guess} at positions #{response}"
#   end
# 
#   def pick_secret_word
#     puts "Think of a secret word; how long is it?"
# 
#     begin
#       Integer(gets.chomp)
#     rescue ArgumentError
#       puts "Enter a valid length!"
#       retry
#     end
#   end
# 
#   def check_guess(guess)
#     puts "Player guessed #{guess}"
#     puts "What positions does that occur at?"
# 
#     # didn't check for bogus input here; got lazy :-)
#     positions = gets.chomp.split(",").map { |i_str| Integer(i_str) }
#   end
# 
#   def require_secret
#     puts "What word were you thinking of?"
#     gets.chomp
#   end
# end
# 
# class ComputerPlayer
#   def self.player_with_dict_file(dict_file_name)
#     ComputerPlayer.new(File.readlines(dict_file_name).map(&:chomp))
#   end
# 
#   def initialize(dictionary)
#     @dictionary = dictionary
#   end
# 
#   def pick_secret_word
#     @secret_word = @dictionary.sample
# 
#     @secret_word.length
#   end
# 
#   def check_guess(guess)
#     response = []
# 
#     @secret_word.split("").each_with_index do |letter, index|
#       response << index if letter == guess
#     end
# 
#     response
#   end
# 
#   def register_secret_length(length)
#     # begining to play again; reset candidate_words
#     @candidate_words = @dictionary.dup
# 
#     @candidate_words.select! { |word| word.length == length }
#   end
# 
#   def guess(board)
#     # I left this here so you can see it narrow things down.
#     p @candidate_words
# 
#     freq_table = freq_table(board)
# 
#     most_frequent_letters = freq_table.sort_by { |letter, count| count }
#     letter, count = most_frequent_letters.last
# 
#     # we'll never repeat a guess because we only look at unfilled
#     # positions to calculate frequency, and we remove a word from the
#     # candidates if it has a guessed letter an unfilled position in
#     # the board.
#     letter
#   end
# 
#   def handle_response(guess, response_indices)
#     @candidate_words.reject! do |word|
#       should_delete = false
# 
#       word.split("").each_with_index do |letter, index|
#         if (letter == guess) && (!response_indices.include?(index))
#           should_delete = true
#           break
#         elsif (letter != guess) && (response_indices.include?(index))
#           should_delete = true
#           break
#         end
#       end
# 
#       should_delete
#     end
#   end
# 
#   def require_secret
#     @secret_word
#   end
# 
#   private
#   def freq_table(board)
#     # this makes 0 the default value; see the RubyDoc.
#     freq_table = Hash.new(0)
#     @candidate_words.each do |word|
#       board.each_with_index do |letter, index|
#         # only count letters at missing positions
#         freq_table[word[index]] += 1 if letter.nil?
#       end
#     end
# 
#     freq_table
#   end
# end