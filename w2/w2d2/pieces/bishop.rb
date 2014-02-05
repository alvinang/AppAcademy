class Bishop < SlidingPiece
  def move_dirs
    DIAGONAL
  end
  def to_s
    "\u2657 "
  end

end
