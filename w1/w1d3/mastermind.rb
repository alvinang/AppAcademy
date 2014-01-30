# In this project, you'll implement the game Mastermind.
# 
# There are six different peg colors:
# Red
# Green
# Blue
# Yellow
# Orange
# Purple
# The computer will select a random code of four pegs.
# The user gets ten turns to guess the code.
# You decide how the user inputs his guess.
# Maybe like so "RGBY" for red-green-blue-yellow.
# The computer should tell the player how many exact matches (right color in right spot) and near matches (right color, wrong spot) he or she has.
# Game ends when user guesses the code, or out of turns.
# Call your TA over and have them review your classes and general implementation before moving on.
# Suggestions
# 
# You might want a Code class. You might want a Code::parse class method to parse user input. You might want a Code::random method to generate a random code sequence.
# You might want a Game class. This could keep track of the number of turns and have methods for reading user input and printing output.

class Code
  attr_reader :color_array, :computer_guess
  
  COLOR_ARRAY = ["R", "G", "B", "Y", "O", "P"]

  def initialize code
    @computer_guess = code
  end

  def parse? user_guess
    user_guess_array = user_guess.split("")

    return true if self.win?(user_guess_array)
    self.exact_match_print(user_guess_array)
    self.color_match(user_guess_array)

    false
  end

  def win? user_guess_array
    return true if exact_match_count(user_guess_array) == 4
    false
  end

  def color_match user_guess_array
    matches = 0
    checked_arr = []
    user_guess_array.each do |color|
      checked_arr << color if @computer_guess.include? color
    end
    
    puts "You have #{checked_arr.uniq.size} color matches"
  end

  def exact_match_print user_guess_array
    puts "You have #{self.exact_match_count(user_guess_array)} exact matches"
  end

  def exact_match_count user_guess_array
    exact_matches = 0
    user_guess_array.each_with_index do |user, index|
      exact_matches +=1 if @computer_guess[index] == user
    end
    exact_matches
  end

  # factory method
  def self.random_code
    self.new(COLOR_ARRAY.sample(4))
  end

end


class Game
  attr_accessor :user_guess

  def initialize
    @board = Code.random_code
    @user_guess = ""
  end

  def get_guess
    puts "What's your guess in RGBY Format?"
    self.user_guess = gets.chomp.upcase
    self.user_guess.size == 4 ? self.user_guess : (puts "Please enter a 4 colors! (i.e. RGBY)"; get_guess)    
  end

  def play
    counter = 0
    while counter <= 10
      get_guess
      if @board.parse? self.user_guess        
        puts ""
        puts "############"
        puts "# You won! #"
        puts "############"
        return
      end
      counter += 1
    end
    puts "You lose!"
  end
end


if __FILE__ == $PROGRAM_NAME
  Game.new.play
end

##############################################################################################################################
# Suggested solution by AppAcademy 

# module Mastermind
#   class Code
#     PEG_COLORS = [
#       :blue,
#       :green,
#       :orange,
#       :purple,
#       :red,
#       :yellow
#     ]
# 
#     COLOR_MAPPING = {
#       "B" => :blue,
#       "G" => :green,
#       "O" => :orange,
#       "P" => :purple,
#       "R" => :red,
#       "Y" => :yellow
#     }
# 
#     def self.parse(str)
#       # factory method
#       pegs = str.split("").map do |letter|
#         raise "parse error" unless COLOR_MAPPING.has_key?(letter)
# 
#         COLOR_MAPPING[letter]
#       end
# 
#       Code.new(pegs)
#     end
# 
#     def self.random
#       pegs = []
#       4.times { pegs << PEG_COLORS.sample }
# 
#       Code.new(pegs)
#     end
# 
#     def initialize(pegs)
#       @pegs = pegs
#     end
# 
#     def [](i)
#       pegs[i]
#     end
# 
#     def exact_matches(other_code)
#       exact_matches = 0
#       pegs.each_index do |i|
#         exact_matches += 1 if self[i] == other_code[i]
#       end
# 
#       exact_matches
#     end
# 
#     def near_matches(other_code)
#       other_color_counts = other_code.color_counts
# 
#       near_matches = 0
#       self.color_counts.each do |color, count|
#         next unless other_color_counts.has_key?(color)
# 
#         # Give credit for up to count near matches
#         near_matches += [count, other_color_counts[color]].min
#       end
# 
#       near_matches - self.exact_matches(other_code)
#     end
# 
#     def ==(other_code)
#       return false unless other_code.is_a?(Code)
# 
#       self.pegs == other_code.pegs
#     end
# 
#     protected
#     attr_reader :pegs
# 
#     def color_counts
#       color_counts = Hash.new(0)
# 
#       @pegs.each do |color|
#         color_counts[color] += 1
#       end
# 
#       color_counts
#     end
#   end
# 
#   class Game
#     MAX_TURNS = 10
# 
#     def initialize(secret_code = Code.random)
#       @secret_code = secret_code
#     end
# 
#     def play
#       MAX_TURNS.times do
#         guess = get_guess
# 
#         if guess == @secret_code
#           puts "You're worth it!"
#           return
#         end
# 
#         display_matches(guess)
#       end
# 
#       puts "You aren't very good at this..."
#     end
# 
#     private
# 
#     def get_guess
#       puts "Guess the code:"
# 
#       begin
#         Code.parse(gets.chomp)
#       rescue
#         puts "Error parsing code!"
#         retry
#       end
#     end
# 
#     def display_matches(guess)
#       exact_matches = @secret_code.exact_matches(guess)
#       near_matches = @secret_code.near_matches(guess)
# 
#       puts "You got #{exact_matches} exact matches!"
#       puts "You got #{near_matches} near matches!"
#     end
#   end
# end
# 
# if __FILE__ == $PROGRAM_NAME
#   Mastermind::Game.new.play
# end