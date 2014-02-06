class SteppingPiece < Piece

  def moves
    x, y = @position
    movements = move_dirs.map do |x_offset, y_offset|
      [x + x_offset, y + y_offset]
    end

    movements.select do |movement|
      (0..7).cover?(movement[0]) && (0..7).cover?(movement[1])
    end
  end

  def move(position)
    return false unless super
    possible_moves = moves
    return false unless possible_moves.include?(position)
    true
  end

end
