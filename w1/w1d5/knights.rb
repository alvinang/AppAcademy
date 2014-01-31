require './treenode.rb'

class KnightPathFinder

  def initialize(start_position)
    @start_position = start_position
    # buid_move_tree
  end

  def build_move_tree
    visited = [start_position]
    root = TreeNode.new(nil, start_position)
    possible_moves = new_move_positions(start_position)

    possible_moves.each do |move|
      root.add_child(move) # but not if you've already visited there
    end

  end

  def new_move_positions(pos)
    x, y = pos
    @new_moves = []

    possible_indices = {
      1 => [2, -2],
      2 => [1, -1],
      -1 => [2, -2],
      -2 => [1, -1]
    }

    [1,2,-1,-2].each do |x_offset|
      new_x = x + x_offset
      possible_indices[x_offset].each do |y_offset|
        new_y = y + y_offset
        @new_moves << [new_x, new_y]
      end
    end

    @new_moves.select do |move|
      move[0] < 8 && move[0] >= 0 && move[1] < 8 && move[1] >= 0
    end
  end



end