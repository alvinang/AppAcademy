# Write a number guessing game. The computer should choose a number between 1 and 100. It should prompt the user for guesses. Each time, it will prompt the user for a guess; it will return too high or too low. It should track the number of guesses the player took.

def number_game

  puts "Welcome to the number game.\n Go ahead and guess a number. I'm waiting\n"
  print "=> "
  player_number = gets.chomp.to_i

  turns = 1
  secret_number = rand(100)

  while (player_number != secret_number )
    puts "Your guess was wrong it was too #{player_number < secret_number ? "low" : "high"}."
    print "=> "
    player_number = gets.chomp.to_i
    turns += 1
  end

  puts "Congratulations! You won! Arent you lucky!?\n It only took you #{turns} guesses"
end

# alternative to use case-when
# def guessing_game
#   secret = rand(1..100)
# 
#   guesses = 0
#   while true
#     puts "Guess my secret!"
#     guess = Integer(gets.chomp)
# 
#     case guess <=> secret
#     when -1
#       puts "Too low!"
#     when 0
#       puts "My secret is found out!"
#       break
#     when 1
#       puts "Too high!"
#     end
# 
#     guesses += 1
#   end
# 
#   puts "It took you #{guesses} guesses"
# end