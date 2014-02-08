class Array
  def my_uniq
    [].tap do |uniq|
      self.each do |el|
        uniq << el unless uniq.include?(el)
      end
    end
  end

  def two_sum
    [].tap do |sums|
      self.each_with_index do |el, idx|
        (idx + 1).upto(self.length - 1) do |idx2|
          sums << [idx, idx2] if (el + self[idx2] == 0 and el != 0)
        end
      end
    end
  end

end


class TowersOfHanoi
  attr_reader :towers
  def initialize(size = 3)
    @towers = Array.new(3){[]}
    @towers[0] = size.downto(1).to_a
    @size = size
  end

  def play
    until won?
      move(gets.chomp.split(",").map(&:to_i))
      p @towers
    end
  end
  def move(array)
    from, to = array

    if !@towers[to].empty? && @towers[from].last > @towers[to].last
      raise "Invalid Move"
    else
      disc = @towers[from].pop
      @towers[to] << disc
    end
  end

  def won?
    @towers.last.length == @size
  end
end

def my_transpose(array)
  Array.new(array.length){Array.new(3)}.tap do |transpose|
    array.each_index do |i|
      array.each_index do |j|
        transpose[j][i] = array[i][j]
      end
    end
  end
end

def stock_picker(array)
  max = 0
  result = []

  array.each_index do |idx1|
    ((idx1 + 1)...(array.length)).each do |idx2|
      if array[idx2] - array[idx1] > max
        max = array[idx2] - array[idx1]
        result = [idx1, idx2]
      end
    end
  end

  result
end