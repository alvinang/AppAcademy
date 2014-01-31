require './treenode'

class KnightPathFinder
  attr_accessor :root

  def initialize(start_position)
    @start_position = start_position
    build_move_tree
  end

  def build_move_tree
    visited = [@start_position]
    @root = TreeNode.new(nil, @start_position)
    queue = [@root]

    until queue.empty?
      parent_node = queue.first.parent
      current_node   = queue.shift
      possible_moves = new_move_positions(current_node.value)

      possible_moves.each do |move|
        unless visited.include?(move)
          new_node = TreeNode.new(current_node, move)
          current_node.add_child(new_node)
          queue << new_node
          visited << move
        end
      end
    end

    visited.sort

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

  def find_path(target_pos)
    @root.dfs(target_pos)
  end

end
