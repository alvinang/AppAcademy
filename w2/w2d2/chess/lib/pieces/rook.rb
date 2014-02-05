class Rook < SlidingPiece

  def move_dirs
    ORTHAGONAL
  end

  def to_s
    "\u2656 "
  end
end
