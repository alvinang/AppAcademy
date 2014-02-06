require './piece'
require './board'
require './game'
require './human_player'

b = Board.new

p b.display_board
b.


# test generate board (ok)

# p b.object_id == b.dup.object_id

# p = Piece.new(b, [1, 1], :r, false)
# p = Piece.new(b, [2, 2], :r, false)

# Check board range (ok)
# p p.board_range?

# Check king (ok)
# p p.king

# promote (ok)
# p p.promote

# Check Perform Slide (error)
# p p.perform_slide([2, 2])

# Check Perform Jump


# Check Perform Jump!


# Check Valid Jump


# Find possible moves (ok)
# p p.find_possible_moves(p.move_diffs)

# Empty? (error)
# p p.empty?


# move diffs (ok)
# p p.move_diffs


# maybe promote (ok)
# p p.maybe_promote?

# diff between require, require_relative
# def [](pos), does that work?
# 