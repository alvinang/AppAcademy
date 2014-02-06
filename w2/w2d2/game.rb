class Game

  attr_accessor :board

  def initialize
    @board = Board.new
    @player1, @player2 = HumanPlayer.new(@board, :w), HumanPlayer.new(@board, :b)
    @current_turn = @player1
  end

  def display_board
    @board.board.each do |row|
      row.each do |piece|
        print piece.nil? ? '- ' : piece
      end
      puts ''
    end
  end

  def play
    until @board.checkmate?(:w) || @board.checkmate?(:b)
      begin
        move = @current_turn.play_turn
        selected_piece = @board.board[move[0][1]][move[0][0]]
        if selected_piece && (selected_piece.color != @current_turn.color)
          raise ArgumentError, "You can only select your own pieces!"
        end
        @board.move(move.first, move.last)
        @current_turn = @current_turn == @player1 ? @player2 : @player1
      rescue ArgumentError => e
        system('clear')
        puts e.message
        sleep(1)
        retry
      end
    end

    puts "Game Over! You freaking won!"
  end

end
