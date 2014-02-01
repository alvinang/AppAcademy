class TicTacToeNode

  attr_accessor :prev_move_pos

  def initialize(board, mark, parent = nil, prev_move_pos = nil)
    @board = board
    @mark = mark
    @prev_move_pos = prev_move_pos # check later
    @op_mark = other_player(@mark)
    @children = children
    @parent = parent
  end

  def children
    all_possible_moves = []

    updated_board = @board
    updated_board.each_with_index do |row, index|
      puts "a row!"
      row.each_index do |pos|
        if updated_board[index][pos].nil?
        puts "#{index}, #{pos}"
        updated_board[index][pos] = @mark
        child = TicTacToeNode.new(updated_board, @op_mark, self, [index, pos])

        self.add_child(child)
        all_possible_moves << child
        updated_board[index][pos] = nil
      end
    end
  end

  all_possible_moves
end

def add_child(child)
  self.children << child
  child.prev_move_pos = self
end

def build_move_tree(parent_node)
  @children.each do |child|
    possible_moves = child.children
    parent_node.add_child(child) unless possible_moves.nil?
  end
end

def winning_node?(player)
  return true if @board.winner? == player

  self.children.each do |child|
    return child.winning_node?(other_player(player))
  end
  false
end

def losing_node?(player)
  return true if @board.winner? == other_player(player)

  self.children.each do |child|
    return false if child.winning_node?(other_player(player))
  end
  false
end

def other_player(player)
  player == :x ? :o : :x
end
end