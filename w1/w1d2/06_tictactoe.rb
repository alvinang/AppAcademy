# Tic-Tac-Toe
# 
# Let's write a Tic-Tac-Toe game!
# 
# You should have a Board class and a Game class. The board should have methods like #won?, winner, empty?(pos), 
# place_mark(pos, mark), etc.
# The Game class should have a play method that loops, reading in user moves. When the game is over, exit the loop.
# You should have a class that represents a human player (HumanPlayer), and another class for a computer player 
# (ComputerPlayer). Start with the human player first.
# Both HumanPlayer and ComputerPlayer should have the same API; they should have the same set of public methods. 
# This means they should be interchangeable.
# Your Game class should be passed two player objects on instantiation; because both player classes have the same API, the game should not know nor care what kind of players it is given.
# Keep the computer AI simple: make a winning move if available; else move randomly.

class Board

  def initialize
    @board = Array.new(3) { Array.new(3) }
  end

  def won?
    if @board.each
  end

  def winner

  end

  def empty?(pos) #pos == array
    @board[pos.first][pos.last] == " "
  end

  def place_mark(pos, mark)
    @board[pos.first][pos.last] = mark if empty? (pos)
  end

end


class Game

  attr_accessor :board
  def initialize board, player, computer
    @player = []
    @player << HumanPlayer.new("X") << ComputerPlayer.new("O")
    @board = Board.new

  end

  def play
    while !(won)

      @player.each do |player|

        move = player.get_move
        until @board.place_mark(move, player.mark) == player.mark
          move = player.get_move
        end

      end

    end
  end

  def check_move input
    @board.empty?(input)
  end

end


class HumanPlayer

  attr_accessor :mark
  def initialize mark
    @mark = mark
  end

  def get_move
    puts "State coordinates of your mark"
    gets.chomp.split(",").map(&:to_i)
  end
end


class ComputerPlayer

  def get_move

end

