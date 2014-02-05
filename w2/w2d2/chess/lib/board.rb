
class Board
  attr_accessor :board, :kings

  START_POSITION = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
  START_ROW = [0, 1, 6, 7]

  def initialize
    @board = Array.new(8){Array.new(8)}
    setup_board
    @kings = { b: @board[0][4], w: @board[7][4] }
  end

  def setup_board
    START_ROW.each do |row|
      color = row > 3 ? :w : :b
      if row == 1 || row == 6
        @board[row].each_index do |index|
          @board[row][index] = Pawn.new([index, row], self, color)
        end
      else
        @board[row].each_index do |index|
          @board[row][index] = START_POSITION[index].new([index, row], self, color)
        end
      end
    end

    @board
  end

  def move(start_pos, end_pos)
    start_x, start_y = start_pos
    end_x, end_y = end_pos
    piece = @board[start_y][start_x]
    if piece.move(end_pos)
      piece.position = end_pos
      @board[start_y][start_x] = nil
      @board[end_y][end_x] = piece
    else
      raise ArgumentError, "Can't move there asshole!"
    end
  end

  def in_check?(color)
    king_position = @kings[color].position
    pieces(color == :b ? :w : :b).each do |piece|
      return true if piece.move(king_position)
    end
  end

  def pieces(color)
    [].tap do |pieces_found|
      @board.each do |row|
        row.each do |piece|
          pieces_found << piece if !piece.nil? && piece.color == color
        end
      end
    end
  end

  def dup
    new_board = Board.new
    check_board = Array.new(8){ [] }
    @board.each_with_index do |row, index|
      row.each do |piece|
        duped_piece = (piece.nil? ? nil : piece.dup)
        check_board[index] << duped_piece
        if piece.is_a?(King)
          new_board.kings[piece.color] = duped_piece
        end
      end
    end

    new_board.board = check_board
    new_board
  end

end
