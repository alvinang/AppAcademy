class Pawn < Piece

  DIRECTION = [[0, 1], [0, 2], [0, -1], [0, -2]]
  WHITE_DIAGONALS = [[-1, -1], [1, -1]]
  BLACK_DIAGONALS = [[1, 1], [-1, 1]]

  def initialize(position, board, color)
    super
    @starting_position = position
  end

  def to_s
    @color == :w ? "\u2659" : "\u265F"
  end

  def move_dirs
    direction = DIRECTION.dup

    if @starting_position != @position
      direction.delete_at(3)
      direction.delete_at(1)
      return @color == :b ? [direction.first] : [direction.last]
    end

    return DIRECTION[0..1] if @color == :b
    DIRECTION[2..3]
  end

  def move(position)
    return false unless super
    moves.include?(position)
  end

  def moves
    x, y = @position
    possible_moves = []
    move_dirs.each do |x_offset, y_offset|
      new_x, new_y = x + x_offset, y + y_offset
      if ((0..7).cover?(new_x) && (0..7).cover?(new_y))
        possible_moves << [new_x, new_y] if @board.board[new_y][new_x].nil?
      end
    end

    # Handle taking pieces diagonally.
    diagonals = (@color == :w) ? WHITE_DIAGONALS : BLACK_DIAGONALS
    diagonals.each do |x_offset, y_offset|
      new_x, new_y = x + x_offset, y + y_offset
      if ((0..7).cover?(new_x) && (0..7).cover?(new_y))
        other_piece = @board.board[new_y][new_x]
        possible_moves << [new_x, new_y] if other_piece && other_piece.color != @color
      end
    end
    possible_moves
  end

end