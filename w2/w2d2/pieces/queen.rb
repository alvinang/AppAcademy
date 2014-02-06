class Queen < SlidingPiece

  def move_dirs
    DIAGONAL + ORTHAGONAL
  end

  def to_s
    @color == :w ? "\u2655" : "\u265B"
  end
end