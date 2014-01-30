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
  
  attr_reader :rows
  
  def initialize
    @rows = Array.new(3) { Array.new(3) }
  end
  
  def cols
    cols = @rows
    cols.transpose
  end
  
  def diagonals
    down_diag = [[0,0], [1,1], [2,2]]
    up_diag = [[0,2], [1,1], [2,0]]
    
    [down_diag, up_diag].map do |diag|
      diag.map { |x,y| @rows[x][y] }
    end
  end
  
  def tied?
    return false if won? 
    @rows.all? { |row| row.none? { |el| el.nil? } }
  end
  
  def won?
    [@rows + cols + diagonals].each do |row|
      return :x if row == [:x, :x, :x]
      return :o if row == [:o, :o, :o]
    end
  end  
      
  end
  
  def winner
    tied? || won?
  end
  
  def empty?(pos) #pos a coordinate array
    self[pos].nil?
  end
  
  def place_mark(pos, mark)
    @board[pos] << mark if empty?(pos)
  end
  
end


class Game
  
  attr_reader :board, :player
  
  def initialize(player1, player2)
    @player = { :x => player1, :y => player2 }
    @board = Board.new
  end
  
  def play
    
  end
  
end

class HumanPlayer
  def initialize(name = 'Alvin')
    @name = name
  end
  
  def move(pos, mark)
  end
  
end


class ComputerPlayer
  
end

################################################################

# Suggested Solution by App Academy with additional notes/comments
# class Board
#   attr_reader :rows
#   
#   def self.blank_grid
#     Array.new(3) { Array.new(3) }
#   end
# 
#   # for inheritance purposes, in case we create a new class. class BigBoard < Board
#   # self.class will call Bigboard instead of Board
#   # rows = ... is used mostly for debuggins purposes to send in different board & check other methods
#   def initialize(rows = self.class.blank_grid)
#     @rows = rows
#   end
# 
#   def [](pos)
#     x, y = pos[0], pos[1]
#     @rows[x][y]
#   end
#   
#   
#   def []=(pos, mark)
#     raise "mark already placed there!" unless empty?(pos)
# 
#     x, y = pos[0], pos[1]
#     @rows[x][y] = mark
#   end
#   
#   # return transposed array
#   def cols
#     cols = [[], [], []]
#     @rows.each do |row|
#       row.each_with_index do |mark, col_idx|
#         cols[col_idx] << mark
#       end
#     end
# 
#     cols
#   end
#   
#   # outputs two arrays within array to showcase diag
#   def diagonals
#     down_diag = [[0, 0], [1, 1], [2, 2]]
#     up_diag = [[0, 2], [1, 1], [2, 0]]
# 
#     [down_diag, up_diag].map do |diag|
#       # runs down_diag as diag, then up_diag
#       # Note the `x, y` inside the block; this unpacks, or
#       # "destructures" the argument. Read more here:
#       # http://tony.pitluga.com/2011/08/08/destructuring-with-ruby.html
#       diag.map { |x, y| @rows[x][y] }
#     end
#   end
# 
#   # duplicate @rows
#   def dup
#     duped_rows = rows.map(&:dup)
#     self.class.new(duped_rows)
#   end
# 
#   # check if space is empty
#   def empty?(pos)
#     self[pos].nil?
#     # === self[](pos).nil?
#   end
# 
#   # fill up all the spaces but no winner
#   def tied?
#     return false if won?
#     # .all? returns true if block never returns false or nil 
#     # none? return true if none is true
#     # no empty space?
#     @rows.all? { |row| row.none? { |el| el.nil? }}
#   end
# 
#   # game over if someone wins or game ties
#   def over?
#     # style guide says to use `or`, but I (and most others) prefer to
#     # use `||` all the time. We don't like two ways to do something
#     # this simple.
#     won? || tied?
#   end
# 
#   def winner
#     # triple == [:x, :x, :x], [:o, :o, :x], ...
#     (rows + cols + diagonals).each do |triple|
#       return :x if triple == [:x, :x, :x]
#       return :o if triple == [:o, :o, :o]
#     end
# 
#     nil
#   end
# 
#   def won?
#     !winner.nil?
#   end
# end
# 
# # Notice how the Board has the basic rules of the game, but no logic
# # for actually prompting the user for moves. This is a rigorous
# # decomposition of the "game state" into its own pure object
# # unconcerned with how moves are processed.
# 
# class TicTacToe
#   
#   class IllegalMoveError < RuntimeError
#   end
# 
#   attr_reader :board, :players, :turn
# 
#   def initialize(player1, player2)
#     @board = Board.new
#     @players = { :x => player1, :o => player2 }
#     @turn = :x
#   end
#   
#   
#   def run
#     # until won? || tied?
#     until self.board.over?
#       play_turn
#     end
# 
#     if self.board.won?
#       winning_player = self.players[self.board.winner]
#       puts "#{winning_player.name} won the game!"
#     else
#       puts "No one wins!"
#     end
#   end
# 
#   def show
#     # not very pretty printing!
#     self.board.rows.each { |row| p row }
#   end
# 
#   private
#   def place_mark(pos, mark)
#     if self.board.empty?(pos)
#       self.board[pos] = mark
#       true
#     else
#       false
#     end
#   end
# 
#   
#   def play_turn
#     while true
#       current_player = self.players[self.turn]
#       pos = current_player.move(self, self.turn)
# 
#       break if place_mark(pos, self.turn)
#     end
# 
#     # swap next whose turn it will be next
#     @turn = ((self.turn == :x) ? :o : :x)
#   end
# end
# 
# class HumanPlayer
#   attr_reader :name
# 
#   def initialize(name)
#     @name = name
#   end
#   
#   # can use begin, retry, end instead of do while
#   # checks if coordinate is valid
#   def move(game, mark)
#     game.show
#     while true
#       puts "#{@name}: please select your space"
#       x, y = gets.chomp.split(",").map(&:to_i)
#       if HumanPlayer.valid_coord?(x, y)
#         return [x, y]
#       else
#         puts "Invalid coordinate!"
#       end
#     end
#   end
# 
#   private
#   def self.valid_coord?(x, y)
#     [x, y].all? { |coord| (0..2).include?(coord) }
#   end
# end
# 
# class ComputerPlayer
#   attr_reader :name
# 
#   def initialize
#     @name = "Tandy 400"
#   end
# 
#   def move(game, mark)
#     winner_move(game, mark) || random_move(game)
#   end
# 
#   private
#   # finds next available empty space, winning move applies when 8 spaces are taken
#   def winner_move(game, mark)
#     (0..2).each do |x|
#       (0..2).each do |y|
#         board = game.board.dup
#         pos = [x, y]
# 
#         next unless board.empty?(pos)
#         board[pos] = mark
# 
#         return pos if board.winner == mark
#       end
#     end
# 
#     # no winning move
#     nil
#   end
# 
#   def random_move(game)
#     board = game.board
#     while true
#       range = (0..2).to_a
#       pos = [range.sample, range.sample]
# 
#       return pos if board.empty?(pos)
#     end
#   end
# end
# 
# if __FILE__ == $PROGRAM_NAME
#   hp = HumanPlayer.new("Ned")
#   cp = ComputerPlayer.new
# 
#   TicTacToe.new(hp, cp).run
# end



