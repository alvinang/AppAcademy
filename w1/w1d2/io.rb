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
