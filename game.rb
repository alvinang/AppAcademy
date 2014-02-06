class Game
  
  attr_reader :initial_move, :final_move
  
  def initialize
    @board = Board.new
  end
  
  def move_in_board_range?(move)
    move.all? { |coord| (0..7).cover?(coord) }
  end
  
  def play
    until self.board.won?
      print "Initial move: "
      @initial_move = gets.chomp.to_a
      
      print "Final move: "
      @final_move = gets.chomp.to_a
      
      
      
    end        
  end
  
  
  
end

