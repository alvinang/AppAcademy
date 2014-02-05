
class Piece

  attr_reader :color
  attr_accessor :position

  def initialize(position, board, color)
    @position = position
    @motherboard = board
    @board = board.board
    @color = color
  end

  def moves
    # filter moves out of board

  end

  def move(position)
    x, y = position
    target_position = @board[y][x]
    return true if target_position.nil?
    return false if target_position.color == @color
    true # If target_position.color is a different color.
  end

  def move_into_check?(position)
    duped_board = @motherboard.dup
    duped_board.move(@position, position)
    duped_board.in_check?(@color)
  end

  def valid_moves
    moves.select { |possible_move| move(possible_move) }.reject { |p_move| move_into_check?(p_move) }
  end

end
