class TreeNode
  attr_accessor :parent, :children, :value, :path, :counter

  def initialize(parent, value)
    @parent = parent
    @children = []
    @value = value
    @path = []
    @counter = 0
  end

  def print_tree
    puts "Self: #{@value}"
    print "Children: "
    @children.each { |child| print child.value }
  end

  def remove_child(child_node)
    self.children.delete(child_node)
    child_node.parent = nil
  end

  def add_child(child_node)
    # remove the child from previous parent if necessary ?????
    child_node.parent = self
    self.children << child_node
    child_node
  end

  def dfs(value)
     return self if self.value == value
     return nil if self.children.empty?

     self.children.each do |child|
       return child if child.value == value
       dfs_result = child.dfs(value)
       if child.dfs(value).nil?
         next
       else
         # @path << dfs_result.value
         @counter += 1
         return dfs_result
       end
     end

   end

  # def dfs(value)
  #   # p self.value
  #   return self if self.value == value
  #
  #   self.children.each do |child_node|
  #     child_result = child_node.dfs(value)
  #     return child_result unless child_result.nil?
  #   end
  #   nil
  # end

  def bfs(value)
    queue = []
    queue << self

    until queue.empty?
      node = queue.shift
      return node if node.value == value
      node.children.each { |child| queue << child }
    end

  end

end

# a = TreeNode.new(nil, 'a')
# b = TreeNode.new(nil, 'b')
# c = TreeNode.new(nil, 'c')
# a.add_child(b)
# a.add_child(c)
# puts a.dfs('a')
# puts a.dfs('b')
# puts a.dfs('c')
# puts a.dfs('d')