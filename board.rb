class Board
  
  attr_reader :board
  
  def initialize place_piece = true
    @board = Array.new(8) { Array.new(8) }
    generate_board if place_piece == true
    self
  end
  
  def [](pos)
    x, y = pos
    self.board[y][x]
  end
  
  # dup board to check mutliple jump
  def dup
    dup_board = Board.new(false)
    
    dup_board.board.each_with_index do |row, row_index|
      row.each_with_index do |piece, col_index|   
        if piece
          dup_board[row_index][col_index] = Piece.new(
            dup_board, 
            piece.pos.dup, 
            piece.color, 
            piece.king
          )
        end
      end
    end
    
    dup_board
  end
  
  def won?
    # check all remaining pieces whether they are the same color
    pieces_remaining = []
    
    self.board.each_with_index do |row, row_index|
      row.each_with_index do |piece, col_index|
        pieces_remaining << piece unless piece.nil?
      end
    end
    
    color = pieces_remaining.first.color
    
    pieces_remaining.all? { |piece| piece.color == color }
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
  
  def empty? pos
    # need to check if would work
    self[pos].nil?
  end
  
  def display_board
    white_pawn, white_king = " \u26AA", " \u2655"
    black_pawn, black_king = " \u26AB", " \u265B"
    
    self.board.each_with_index do |row, row_index|
      row.each_with_index do |piece, col_index|
        # piece = self.board[row_index][col_index]
        if piece.nil?
          print " \u2610" 
        else
          if piece.color == :r && piece.king
            print white_king
          elsif piece.color == :r && !piece.king
            print white_pawn
          elsif piece.color == :b && piece.king
            print black_king
          elsif piece.color == :b && !piece.king
            print black_pawn
          end
        end
      end
      puts ""
    end
    
  end
  
end