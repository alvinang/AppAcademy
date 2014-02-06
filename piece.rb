class Piece
  
  attr_reader :pos, :color, :king, :board
  
  def initialize(board, pos, color, king)
    @board, @pos, @color, @king = board, pos, color, king
  end
    
  def king?
    @king
  end
  
  def promote
    @king = true if maybe_promote?
  end
  
  def move! target_position
    self.board[target_position] = self
    self.board[current_position] = nil
    self.pos = target_position
    promote if maybe_promote?
  end
  
  # return true/false on successful slide
  def perform_slide target_position
    current_position = self.pos
    if valid_slide?(target_position)
      move!(target_position)
      return true
    else
      return false
    end
  end
  
  # return true/false
  # remove jumped piece from the board
  # target position can be a move sequence
  def perform_jump target_position          
    if valid_jump?(target_position)   
      move!(target_position)
      return true
    else
      return false
    end           
  end

  # call on DUPED as well
  def perform_moves! move_sequence
    move_sequence.each do |target_position|      
      if valid_jump?(target_position) 
        perform_jump(target_position)
      else
        raise InvalidMoveError, 'Move sequence in invalid'
      end
    end
  end
  
  # calls perform_moves! on a duped piece/board
  # if no error raised, true. else false.
  def valid_move_seq? move_sequence
    dup_board = self.board.dup
    
    begin
      dup_board.perform_moves!(move_sequence)
    rescue InvalidMoveError => e
      puts e.message
    else
      return true
    end    
  end
  
  # checks valid_move_seq?
  # then ,calls either perform_moves! or raises invalid move error
  def perform_moves move_sequence
    if valid_move_seq?(move_sequence)
      perform_moves!(move_sequence)
    else
      raise InvalidMoveError, 'Invalid Move!'
    end
    true  
  end
  
  # valid slide for one motion
  def valid_slide? target_position
    return false if !self.board[target_position].nil?
    
    possible_moves = find_possible_moves(move_diffs)    
    possible_moves.include?(target_position) ? true : false
  end
  
  # take target position and see if its a valid jump
  # this will handle king/not king movement
  def valid_jump? target_position
    return false unless self.board[target_position].empty?
    
    # check if target position is a valid position        
    diffs = self.move_diffs.collect { |el| el * 2 }    
    possible_moves = find_possible_moves(diffs)
    #if you cannot move to the target position return false
    return false unless possible_moves.include?(target_position) 
    
    
    # find enemy position to check if its enemy or our own color
    jump_direction = [target_position[0] - self.pos[0], target_position[1] - self.pos[1]]
    enemy_distance = jump_distance.collect { |el| el / 2 }
    enemy_position = [self.pos[0] + enemy_distance[0], self.pos[1] + enemy_distance[1]]
    return false if self.board[enemy_position].color == self.color        
          
    true        
  end
  
  # diff will change pending on move_diffs
  def find_possible_moves diffs
    [].tap do |possible_moves|
      diffs.each do |row|
        possible_moves << [self.pos[0] + row[1], self.pos[1] + row[0]]
      end
    end    
  end
  
  RED_MOVE = [[1, 1], [-1, 1]]
  BLACK_MOVE = [[-1, -1], [1, -1]]
    
  def move_diffs
    if !self.king?
      self.color == :r ? RED_MOVE : BLACK_MOVE
    else
      RED_MOVE + BLACK_MOVE
    end
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