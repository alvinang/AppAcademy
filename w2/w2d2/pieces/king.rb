class King < SteppingPiece

  DIRECTION = [[1, 1], [1, 0], [1, -1], [0, 1],
  [0, -1], [-1, 1], [-1, 0], [-1, -1]]

  def move_dirs
    DIRECTION
  end

  def to_s
    @color == :w ? "\u2654" : "\u265A"
  end

end
