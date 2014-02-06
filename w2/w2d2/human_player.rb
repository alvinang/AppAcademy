require 'dispel'

class HumanPlayer

  attr_reader :color

  def initialize(board, color)
    @board = board
    @cursor_position = [0, 0]
    @color = color
  end

  def board_string
    board_string = @board.display_board
    board_array = board_string.split("\n")
    board_array.map! do |line|
      chars = line.split('')
      new_chars = []
      chars.each do |char|
        new_chars << ' ' + char
      end
      new_chars.join
    end
    board_array.join("\n")
  end

  def move_cursor(x_offset, y_offset)
    current_x, current_y = @cursor_position
    new_x = current_x + x_offset
    return unless (0..15).cover?(new_x)
    new_y = current_y + y_offset
    return unless (0..7).cover?(new_y)
    @cursor_position = [new_x, new_y]
  end

  def play_turn
    positions = []
    Dispel::Screen.open(colors: true) do |screen|
      screen.draw board_string, map, cursor_position
      Dispel::Keyboard.output do |key|
        break if key == "q"
        case key
        when :up then move_cursor(0,-1)
        when :down then move_cursor(0,1)
        when :right then move_cursor(2,0)
        when :left then move_cursor(-2,0)
        when :enter
          positions << [@cursor_position.first / 2, @cursor_position.last]
          if positions.length == 2
            break
          else
            @board.current_piece = positions.first
          end
        end
        screen.draw board_string, map, cursor_position
      end
    end
    positions
  end

  private

  def cursor_position
    pos = @cursor_position.reverse
    pos[1] += 1
    pos
  end

  def map
    map = Dispel::StyleMap.new(8)
    [1, 3, 5, 7].each do |line|
      map.add(["#ffffff", "#A39DA1"], line, 3..4)
      map.add(["#ffffff", "#A39DA1"], line, 7..8)
      map.add(["#ffffff", "#A39DA1"], line, 11..12)
      map.add(["#ffffff", "#A39DA1"], line, 15..16)
    end
    [0, 2, 4, 6, 8].each do |line|
      map.add(["#ffffff", "#A39DA1"], line, 1..2)
      map.add(["#ffffff", "#A39DA1"], line, 5..6)
      map.add(["#ffffff", "#A39DA1"], line, 9..10)
      map.add(["#ffffff", "#A39DA1"], line, 13..14)
    end
    map
  end

end

