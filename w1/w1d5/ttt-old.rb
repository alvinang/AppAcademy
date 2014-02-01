class TicTacToeNode

  def initialize(board, turn, prev_move = nil)
    @board = board
    @next_player = turn
    @other_player = turn == :x ? :o : :x
    @prev_move_position = prev_move
    @children = children
  end

  def add_child(child)
    self.children << child
    child.prev_move_position = self
  end

  def children
    # returns nodes representing potential game states 1 move away from current node
    all_possible_moves = []
    updated_board = @board
    @board.each do |row|
      row.each do |pos| # create treenode
         updated_board[row][pos] = @next_player
         child = TicToeNode.new(updated_board, @other_player, self)
         self.add_child(child)
         all_possible_moves << child
      end
    end
    all_possible_moves
  end

  def losing_node?(player)
    winning_node? == @other_player

    # if all our children are losign_node?
    self.children.each do |child|
      return false if child.winning_node?(player)
    end

    true

    # it's the other player's turn and one fo the children makes us lose
  end

  def winning_node?(player)
    !losing_node?(player)
  end


end


class SuperComputerPlayer < ComputerPlayer
  def move(current_board, mark)
    mark = mark == :x ? :o : :x
    new_node = TicTacToeNode.new(current_board, mark)
    # winning_moves = new_node.children.select { |chid| child.winning_node? }
    new_node.children each do |child|
      # move if child.winning_node?
    end
  end
end