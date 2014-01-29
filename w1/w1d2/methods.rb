def rps input
  winning = [
    ["paper", "rock"],
    ["scissor", "paper"],
    ["rock", "scissor"]
  ]

  won = false
  game = [input, winning.sample.first]

  # game[0] == game[1] ? (return "Draw! [#{game[0]}, #{game[1]}]") : ( winning.each { |scenario| won = true if scenario == game  } )

  if game[0] == game[1]
    puts "Draw! [#{game[0]}, #{game[1]}]"
  else
    winning.each { |scenario| won = true if scenario == game  }
    puts ( won ? "You won! [#{game[0]}, #{game[1]}]" : "You lost [#{game[0]}, #{game[1]}]" )
  end

end


def remix(array)
  alcohols = array.map(&:first)
  mixers  = array.map(&:last)

  mixers.rotate!
  alcohols.zip(mixers)
end


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