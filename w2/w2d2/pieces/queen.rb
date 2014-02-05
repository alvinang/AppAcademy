class Queen < SlidingPiece

  def move_dirs
    DIAGONAL + ORTHAGONAL
  end

  def move(position)
    diagonals = []
    possible_moves = moves
    starting_pos = @position

    possible_moves.each_with_index do |move, index|
      diagonals << move if move.first != starting_pos.first && move.last != starting_pos.last
    end
    if diagonals.include?(position)
      return check_moves(position, diagonals)
    else
      orthagonal = possible_moves.reject { |move| diagonals.include?(move) }
      return check_moves(position, orthagonal) if orthagonal.include?(position)
    end
    false
  end

  def to_s
    "\u2655 "
  end
end