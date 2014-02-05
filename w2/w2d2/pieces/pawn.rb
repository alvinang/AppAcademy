class Pawn < Piece

  DIRECTION = [[0, 1], [0, 2]]

  def to_s
    "\u2659 "
  end

  def move_dirs
    DIRECTION
  end

end