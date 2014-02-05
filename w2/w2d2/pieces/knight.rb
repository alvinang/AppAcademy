class Knight < SteppingPiece

  DIRECTION = [[1, 2], [1, -2], [-1, 2], [-1, -2],
  [2, 1], [2, -1], [-2, 1], [-2, -1]]

  def move_dirs
    DIRECTION
  end

  def to_s
    "\u2658 "
  end
end
