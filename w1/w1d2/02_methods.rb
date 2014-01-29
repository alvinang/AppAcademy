# Implement a Rock, Paper, Scissors game. The method rps should take a string (either "Rock", "Paper" or "Scissors") as a parameter and return the computer's choice, and the outcome of the match. Example:
# rps("Rock") # => "Paper, Lose"
# rps("Scissors") # => "Scissors, Draw"
# rps("Scissors") # => "Paper, Win"

def rps input
  
  winning = [
    ["paper", "rock"],
    ["scissor", "paper"],
    ["rock", "scissor"]
  ]

  unless winning.flatten.include?(input)
    puts "Invalid! rock, paper or scissor!"
    return
  end

  won = false
  game = [input, winning.sample.first]

  # game[0] == game[1] ? (return "Draw! [#{game[0]}, #{game[1]}]") : ( winning.each { |scenario| won = true if scenario == game  } )

  if game[0] == game[1]
    puts "Draw! #{game[0]} vs #{game[1]}"
  else
    winning.each { |scenario| won = true if scenario == game  }
    puts won ? "You WIN! #{game[0]} vs #{game[1]}" : "You LOSE! #{game[0]} vs #{game[1]}" )
  end

end

#############################################################################################
# Implement a Mixology game. The method remix should take an array of ingredient arrays (one alcohol, one mixer) and return the same type of data structure, with the ingredient pairs randomly mixed up. Assume that the first item in the pair array is alcohol, and the second is a mixer. Don't pair an alcohol with an alcohol with or a mixer with a mixer. An example run of the program:
# remix([
#   ["rum", "coke"],
#   ["gin", "tonic"],
#   ["scotch", "soda"]
# ])
# #=> [["rum, "tonic"], ["gin", "soda"], ["scotch", "coke"]]

def remix(array)
  alcohols = array.map(&:first)
  mixers  = array.map(&:last)

  mixers.rotate!
  alcohols.zip(mixers)
  
  # alternative
  # [].tap.each do |remix|
  #   alcohols.each_index do |index|
  #     remix << [alcohols[index], mixers[index]]
  #   end
  # end
  
end




#############################################################################################
# Example of using 'tap'

def something
  cocktails = []
  alcohols.each_index do |index|
    cocktails << [alcohols[index], mixers[index]]
  end
  cocktails
end

def something
  [].tap do |cocktails|
    alcohols.each_index do |index|
      cocktails << [alcohols[index], mixers[index]]
    end
  end
end