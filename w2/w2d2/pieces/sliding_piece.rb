class SlidingPiece < Piece
  ORTHAGONAL = [[0, 1], [0, -1], [1, 0], [-1, 0]]
  DIAGONAL = [[1, 1], [1, -1], [-1, 1], [-1, -1]]

  def moves
    x, y = @position
    possible_moves = []
    move_dirs.each do |x_offset, y_offset|
      (1..7).each do |multiplier|
        new_x, new_y = x + (multiplier * x_offset), y + (multiplier * y_offset)
        #if the new location is off the board, do not add move and break march
        #if the new location has a compatriot, do not add move and break march
        #if the new location has an enemy, add move and break march
        #otherwise keep going

        #if it is on the board
        if ((0..7).cover?(new_x) && (0..7).cover?(new_y))
          new_location = @board.board[new_y][new_x]

          if new_location.nil?
            possible_moves << [new_x, new_y]
          else
            #new location is occupied
            if new_location.color != @color
              #include this in possible moves ONLY if it houses an enemy
              possible_moves << [new_x, new_y]
            end

            break
          end
        else
          #off the board
          break
        end
      end
    end
    possible_moves
  end

  def move(position)
    return false unless super
    possible_moves = moves
    return false unless possible_moves.include?(position)
    true
  end
end
