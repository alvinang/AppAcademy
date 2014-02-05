class King < SteppingPiece

  DIRECTION = [[1, 1], [1, 0], [1, -1], [0, 1],
  [0, -1], [-1, 1], [-1, 0], [-1, -1]]

  def move_dirs
    DIRECTION
  end

  def to_s
    "\u2654 "
  end

end
