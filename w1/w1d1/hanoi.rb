################################################################################################

# Towers of Hanoi
#
# Write a Towers of Hanoi game.
#
# Keep three arrays, which represents the piles of discs. Pick a representation of the discs to store in the arrays; maybe just a number representing their size.
#
# In a loop, prompt the user (using gets) and ask what pile to select a disc from, and where to put it.
#
# After each move, check to see if they have succeeded in moving all the discs, to the final pile. If so, they win!

class TowersOfHanoi

  # initialize and create 3 arrays with the first array to include # of discs
  def initialize(number_of_disc)
    @game = Array.new(number_of_disc) {[]}
    1.upto(number_of_disc) { |n| @game[0] << n }
    @game[0].reverse!

    @check = @game[0].dup
    user_moves
  end

  # ask user for moves
  def make_move(from, to)
    @game[to] << @game[from].pop
    puts " "
    puts "This is your current stack:"
    p @game
  end

  def user_moves
    print "Move from (start from 0)? "
    from = gets.chomp.to_i

    print "Move to (start from 0)? "
    to = gets.chomp.to_i

    if valid_move?(from, to)
      if won?
        puts "Congratulations! You win!"
        return
      end
    else
      puts "Invalid move!"
    end

    make_move(from, to)
  end

  # check if move is valid
  #from isn't nil
  #to is nil OR to is < from
  def valid_move?(from, to)
    return false if @game[from].empty?
    return true if @game[to].empty?
    @game[to].last > @game[from].last ? true : false
  end


  # check if user won after every valid move
  def won?
    @game.last == @check ? true : false
  end

end