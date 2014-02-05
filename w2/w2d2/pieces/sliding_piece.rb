class SlidingPiece < Piece
  ORTHAGONAL = [[0, 1], [0, -1], [1, 0], [-1, 0]]
  DIAGONAL = [[1, 1], [1, -1], [-1, 1], [-1, -1]]

  def moves
    x, y = @position
    possible_moves = []
    (1..7).each do |multiplier|
      move_dirs.each do |x_offset, y_offset|
        new_x, new_y = x + (multiplier * x_offset), y + (multiplier * y_offset)
        if ((0..7).cover?(new_x) && (0..7).cover?(new_y))
          possible_moves << [new_x, new_y]
        end
      end
    end
    possible_moves
  end

  def move(position)
    debugger
    return false unless super
    possible_moves = moves
    return false unless possible_moves.include?(position)

    check_moves(position, possible_moves)
  end

  def check_moves(position, possible_moves)
    x_direction, y_direction = [], []
    possible_moves.each_index do |index|
      x_direction << possible_moves[index] if index.odd?
      y_direction << possible_moves[index] if index.even?
    end
    if x_direction.include?(position)
      x_direction = x_direction.take(x_direction.index(position))
      return x_direction.all? { |x_coord, y_coord| @board[y_coord][x_coord].nil? }
    elsif y_direction.include?(position)
      y_direction = y_direction.take(y_direction.index(position))
      return y_direction.all? { |x_coord, y_coord| @board[y_coord][x_coord].nil? }
    end
    false
  end
end
