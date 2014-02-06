class Game
  
  attr_reader :board
  
  def initialize
    @board = Board.new
  end
  
  def move_in_board_range?(move)
    move.all? { |coord| (0..7).cover?(coord) }
  end
  
  def play
    until @board.won?
      print "Initial move: "
      initial_move = gets.chomp.split(",").map!(&:to_i)
      
      print "Final move: "
      final_move = gets.chomp.split(",").map!(&:to_i)
      
      current_piece = @board.board[initial_move[0]][initial_move[1]]
      if current_piece.valid_slide? (final_move)
        current_piece.perform_slide(final_move)
      elsif current_piece.valid_jump? (final_move)
        current_piece.perform_jump(final_move)
      end
                    
    end        
  end
    
end

