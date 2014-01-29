class Board

  def initialize(size = 3)
    @board = Array.new(size) { Array.new(size, ' ') }
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

