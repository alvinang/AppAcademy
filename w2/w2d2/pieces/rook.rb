class Rook < SlidingPiece

  def move_dirs
    ORTHAGONAL
  end

  def to_s
    @color == :w ? "\u2656" : "\u265C"
  end
end
