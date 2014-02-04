require 'yaml'
require 'io/console' # for STDIN.getch

class Tile
  attr_reader :position

  def initialize(args)
    @position, @bomb, @board = args[:position], args[:bomb], args[:board]
    @flag, @reveal = false, false
    @diffs = [1, 0, -1].product([1,0,-1]) - [[0, 0]]
  end

  def reveal
    @reveal = true
    if self.bombed?
      return false
    elsif self.blank?
      self.neighbors.each do |neighbor|
        neighbor.reveal unless neighbor.revealed?
      end
    end
  end

  def set_flag
    @flag = true
  end

  def unset_flag
    @flag = false
  end

  def neighbors
    coordinates = []
    @diffs.each do |x, y|
      x, y = self.position.first + x, self.position.last + y
      coordinates << [x, y]
    end
    
    @board.board.select{ |tile| coordinates.include?(tile.position) }
  end

  def neighbor_bomb_count
    self.neighbors.count { |neighbor| neighbor.bombed? }
  end

  def bombed?
    @bomb
  end

  def flagged?
    @flag
  end

  def revealed?
    @reveal
  end

  def blank?
    self.neighbors.none? { |neighbor| neighbor.bombed? }
  end
end

class Board

  attr_reader :board, :dimensions

  def initialize(dimensions = [9, 9], n_bombs = 10)
    @board = []
    @dimensions = dimensions
    @n_bombs = n_bombs
    generate_board
  end

  def generate_board
    coordinates = (1..@dimensions.first).to_a.product((1..@dimensions.last).to_a)
    bombs = coordinates.sample(@n_bombs)

    coordinates.each do |coordinate|
      bomb = bombs.include?(coordinate)
      @board << Tile.new(:position => coordinate, :bomb => bomb, :board => self)
    end
  end

  def find_tile coordinates
    @board.find { |tile| tile.position == coordinates }
  end
  
  def reveal_tile coordinates
    self.find_tile(coordinates).reveal
  end

  def flag_tile coordinates
    self.find_tile(coordinates).set_flag
  end

  def get_neighbor_bombs coordinates
    self.find_tile(coordinates).neighbor_bomb_count
  end

  def win?
    @board.all? { |tile| tile.revealed? || (tile.bombed? && tile.flagged?) }
  end

  def lost?
    @board.any? {|tile| tile.revealed? && tile.bombed? }
  end
end

class UI
  
  def initialize
    @board = Board.new
    @bomb, @flag, @blank, @unopened = 'B', 'F', '_', '*'
  end

  def display_board
    n_rows = @board.dimensions.first
    @board.board.each_slice(n_rows) do |tiles|
      tiles.each do |tile|
        if !tile.revealed?
          tile.flagged? ? print(@flag) : print(@unopened)
        else
          if tile.bombed?
            print @bomb
          elsif tile.blank?
            print @blank
          else
            print tile.neighbor_bomb_count
          end
        end
      end
      puts ''
    end
  end

  def get_move
    puts "What tile would you like to open or flag? (o, f)"
    move = gets.chomp
  end

  def get_position
    puts "What coordinate would you like to open/flag?"
    position = gets.chomp.split(",").map(&:to_i)
  end

  def play
    until @board.win? || @board.lost?
      puts "Choose a new coordinate"
      display_board
      move, position = get_move, get_position
      if move == "f"
        @board.flag_tile(position)
      elsif move == "o"
        @board.reveal_tile(position)
      end
    end

    if @board.lost?
      puts "Bombed! You lose!"
      return
    else
      puts "You won!"
    end
  end

  def save
    puts "Enter filename to save at: "
    filename = gets.chomp
    
    File.write("#{filename}.yaml", YAML.dump(self))
  end

  # def self.load
  #   ui = YAML.load_file('minesweeper.yaml')
  # end
end

class KeystrokeUI
  
  LAYOUTS = {
    :small => { :dimensions => [9, 9], :n_bombs => 10 },
    :medium => { :dimensions => [16, 16], :n_bombs => 40 },
    :large => { :dimensions => [32, 32], :n_bombs => 160 }
  }
  
  def initialize(size)
    dimensions = LAYOUTS[size]
    @board = Board.new(dimensions[:dimensions], dimensions[:n_bombs])
    @flag, @unopened, @cursor = "\u2690", "\u25FD", "\u25C9"
    @blank, @bomb = " ", ' '
    @cursor_position = [1, 1]
  end

  def display_board
    n_rows = @board.dimensions.first
    side = 1
    puts " " + (1..@board.dimensions.last).to_a.map(&:to_s).join(" ")
    @board.board.each_slice(n_rows) do |tiles|
      print side
      tiles.each do |tile|
        if tile.position == @cursor_position
          print @cursor + ' '
        else
          print get_mark(tile) + ' '
        end
      end
      puts ''
      side += 1
    end
  end

  def get_mark(tile)
    if !tile.revealed?
      tile.flagged? ? @flag : @unopened
    else
      if tile.bombed?
        @bomb
      elsif tile.blank?
        @blank
      else
        tile.neighbor_bomb_count.to_s
      end
    end
  end

  def play
    system('clear')
    until @board.win? || @board.lost?
      puts "Welcome to minesweeper! Move with wasd keys. Flag with u. Unflag with i. Open with o. Quit with q."
      display_board
      move = STDIN.getch
      case move
      when "w"
        up = @cursor_position[0]
        @cursor_position[0] = up - 1 unless up - 1 < 1
      when "a"
        left = @cursor_position[1]
        @cursor_position[1] = left - 1 unless left - 1 < 1
      when "s"
        down = @cursor_position[0]
        unless down + 1 > @board.dimensions.last
          @cursor_position[0] = down + 1
        end
      when "d"
        right = @cursor_position[1]
        unless right + 1 > @board.dimensions.first
          @cursor_position[1] = right + 1
        end
      when "q"
        break
      when "u"
        @board.find_tile(@cursor_position).set_flag
      when "i"
        @board.find_tile(@cursor_position).unset_flag
      when "o"
        @board.find_tile(@cursor_position).reveal
      end
      system('clear')
    end
    if @board.lost?
      display_board
      puts "*** BOMB..You LOSE! Try again :) ***"
    else
      display_board
      puts "You win!"
    end
  end
  
  def save
    puts "Enter filename to save at: "
    filename = gets.chomp
    
    File.write("#{filename}.yaml", YAML.dump(self))
  end
end
  
if __FILE__ == $PROGRAM_NAME
  case ARGV.count
  when 0    
    KeystrokeUI.new(:small).play
  when 1
    YAML.load_file(ARGV.shift).play
  end
end