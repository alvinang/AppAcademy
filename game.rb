require 'io/console' # for STDIN.getch
require 'dispel'

class Game
  
  attr_reader :board, :cursor_position
  
  def initialize
    @board = Board.new
    @cursor_position = [0, 0]
  end
  
  def move_in_board_range?(move)
    move.all? { |coord| (0..7).cover?(coord) }
  end
  
  def play
    system('clear')
    until @board.won?
      puts "Welcome to checkers. Move with wasd keys, select with l."
      @board.display_board
      move = STDIN.getch
      case move
      when "w"
        up = cursor_position[0]
        @cursor_position[0] = up - 1 unless up - 1 < 1
      when "a"
        left = @cursor_position[1]
        @cursor_position[1] = left - 1 unless left - 1 < 1
      when "s"
        down = @cursor_position[0]
        unless down + 1 > 7
          @cursor_position[0] = down + 1
        end
      when "d"
        right = @cursor_position[1]
        unless right + 1 > 7
          @cursor_position[1] = right + 1
        end
      when "q"
        break
      end
      system('clear')
    end
  end
  
  
# dispel  
  # def move_cursor(x_offset, y_offset)
#     current_x, current_y = @cursor_position
#     new_x = current_x + x_offset
#     return unless (0..15).cover?(new_x)
#     new_y = current_y + y_offset
#     return unless (0..7).cover?(new_y)
#     @cursor_position = [new_x, new_y]
#   end
#   
# 
#   def board_string
#     board_string = self.board.display_board
#     board_array = board_string.split("\n")
#     board_array.map! do |line|
#       chars = line.split('')
#       new_chars = []
#       chars.each do |char|
#         new_chars << ' ' + char
#       end
#       new_chars.join
#     end
#     board_array.join("\n")
#   end
#   
#   def play_game
#     until @board.won?
#       begin
#         play
#       rescue InvalidMoveError => e
#         print e.message
#         sleep(1)
#         retry
#       end
#     end      
#   end
#     
#   def play    
#     positions = []
#     
#     Dispel::Screen.open(color: true) do |screen|
#       screen.draw board_string, map, cursor_position   
#   
#       Dispel::Keyboard.output do |key|
#         break if key == "q"
#         case key
#         when :up then move_cursor(0, -1)
#         when :down then move_cursor(0, 1)
#         when :right then move_cursor(1, 0)
#         when :left then move_cursor(-1, 0)
#         when "g"           
#           positions << [@cursor_position.first, @cursor_position.last]
#           if positions.length == 2
#             break
#           else
#             @board.current_piece = positions.first
#           end
#         end
#         screen.draw board_string, map, cursor_position
#       end
#       
#       positions
#     end
#   end
#   
  def cursor_position
    pos = @cursor_position.reverse
    pos[1] += 1
    pos
  end
# 
#   def map
#     map = Dispel::StyleMap.new(8)
#     [1, 3, 5, 7].each do |line|
#       map.add(["#ffffff", "#6C00FA"], line, 3..4)
#       map.add(["#ffffff", "#6C00FA"], line, 7..8)
#       map.add(["#ffffff", "#6C00FA"], line, 11..12)
#       map.add(["#ffffff", "#6C00FA"], line, 15..16)
#     end
#     [0, 2, 4, 6, 8].each do |line|
#       map.add(["#ffffff", "#6C00FA"], line, 1..2)
#       map.add(["#ffffff", "#6C00FA"], line, 5..6)
#       map.add(["#ffffff", "#6C00FA"], line, 9..10)
#       map.add(["#ffffff", "#6C00FA"], line, 13..14)
#     end
#     map
#   end
    
end

