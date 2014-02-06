class Piece

  attr_reader :color
  attr_accessor :position

  def initialize(position, board, color)
    @position = position
    @board = board
    @color = color
  end

  def moves
    # filter moves out of board

  end

  # check if piece can move to end_pos
  def move(position)
    x, y = position
    target_position = @board.board[y][x]
    return true if target_position.nil?
    return false if target_position.color == @color
    true # If target_position.color is a different color.
  end

  def move_into_check?(position)
    duped_board = @board.dup
    duped_board.move!(@position, position)

    duped_board.in_check?(@color)
  end

  def valid_moves
    possible_moves = moves
    return [] if possible_moves.nil?
    possible_moves.select do |possible_move|
      move(possible_move) && !move_into_check?(possible_move)
    end
  end
end
