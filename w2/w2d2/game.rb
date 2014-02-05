class Game

  attr_accessor :board

  def initialize
    @board = Board.new
  end

  def display_board
    @board.board.each do |row|
      row.each do |piece|
        print piece.nil? ? '- ' : piece
      end
      puts ''
    end
  end

end
