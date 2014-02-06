class Piece
  
  attr_reader :pos, :color, :king, :board
  
  def initialize(board, pos, color, king)
    @board, @pos, @color, @king = board, pos, color, king
  end
  
  def [](pos)
    raise "Invalid move, position outside of range" if self.pos.board_range?
    
    x, y = pos
    @board[y][x]    
  end
  
  def board_range?
    (0..7).cover?(self.pos[0]) && (0..7).cover?(self.pos[1])
  end
  
  def king?
    @king
  end
  
  def promote
    maybe_promote? ? @king = true : @king = false
  end
  
  # return true/false on one position move
  def perform_slide(target_position)
    current_position = self.pos
    
    if valid_slide?(target_position)
      self.board[target_position] = self
      self.board[current_position] = nil
      self.pos = target_position
      return true
    else
      return false
    end
  end
  
  # return true/false
  # remove jumped piece from the board
  def perform_jump(target_position)
    # dup board
    dup_board = self.board.dup
      
    # perform_jump! for dup board
    dup_board.perform_moves!(target_position)
    
    # if all jumps valid, perform jump on board
    self.board.perform_moves!(target_position)
    
  end
  
  def perform_moves!(move_sequence)
    move_sequence.each do |target_position|      
      if valid_jump?(target_position) || valid_slide?(target_position)
        self.board[target_position] = self
        self.board[current_position] = nil
        self.pos = target_position        
      else
        raise 'Invalid jump!'
      end
    end
    true
  end
  
  def valid_slide?(target_position)  
    return false if !self.board[target_position].empty?
    
    possible_moves = find_possible_moves(move_diffs)    
    possible_moves.include?(target_position) ? true : false
  end
  
  def valid_jump?(target_position)    
    return false if !self.board[target_position].empty?
    
    diffs = move_diffs.collect { |el| el * 2 }    
    possible_moves = find_possible_moves(diffs)
    possible_moves.include?(target_position) ? true : false    
  end
  
  def find_possible_moves(diffs)    
    [].tap do |possible_moves|
      diffs.each do |row|
        possible_moves << [self.pos[0] + row[1], self.pos[1] + row[0]]
      end
    end    
  end
  
  def empty?
    # need to check if would work
    self.board[self.pos].nil?
  end
  
  RED_MOVE = [[1, 1], [-1, 1]]
  BLACK_MOVE = [[-1, -1], [1, -1]]
    
  def move_diffs
    self.color == :r ? RED_MOVE : BLACK_MOVE
  end
  
  def maybe_promote?
    if self.pos[0] == 0 && self.color == :b
      return true
    elsif self.pos[0] == 7 && self.color == :r
      return true
    end
    
    false        
  end
  
  
end