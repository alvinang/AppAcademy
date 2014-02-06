class Bishop < SlidingPiece

  def move_dirs
    DIAGONAL
  end

  def to_s
    @color == :w ? "\u2657" : "\u265D"
  end

end
