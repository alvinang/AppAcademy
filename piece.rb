class Piece
  
  attr_reader :pos, :color, :king, :board
  
  def initialize(board, pos, color, king)
    @board, @pos, @color, @king = board, pos, color, king
  end
  
  def move_in_board_range?(move)
    move.all?{ |coord| (0..7).cover?(coord) }
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
  # target position can be a move sequence
  def perform_jump(move_sequence)
          
    if valid_move_seq?(move_sequence)
      self.board.perform_moves!(move_sequence) # perform_jump! for dup board
    end  
    false
  end
  
  # call perform moves! on dup board
  # if no error raised, true. else false.
  def valid_move_seq?(move_sequence)
    dup_board = self.board.dup
    
    begin
      if !perform_moves!(move_sequence)
        raise WrongMoveError, 'Invalid jump!'
      end
    rescue WrongMoveError => e
      puts e.message
    end
          
  end
  
  def perform_moves!(move_sequence)
    move_sequence.each do |target_position|      
      if valid_jump?(target_position) || valid_slide?(target_position)
        self.board[target_position] = self
        self.board[current_position] = nil
        self.pos = target_position        
      else
        return false
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