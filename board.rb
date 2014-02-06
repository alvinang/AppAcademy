class Board
  
  attr_reader :board
  
  def initialize(place_piece = true)
    @board = Array.new(8) { Array.new(8) }
    generate_board if place_piece == true
  end
  
  # dup board to check mutliple jump
  def dup
    dup_board = self.board.new(false)
    
    self.board.each do |row|
      row.each do |piece|
        dup_board[row][piece] = piece.dup
      end
    end
    
    dup_board
  end
  
  def generate_board
    starting_row = [0, 1, 2, 5, 6, 7]
    
    starting_row.each_with_index do |row, index|
      color = (index < 3 ? :r : :b)
      8.times do |col|        
        if index % 2 == 0 && col % 2 == 0          
          @board[row][col] = Piece.new(self, [col, row], color, false)
        elsif index % 2 != 0 && col % 2 != 0
           @board[row][col] = Piece.new(self, [col, row], color, false)
         else
           @board[row][col] = nil
         end
       end
     end 
  end
  
end