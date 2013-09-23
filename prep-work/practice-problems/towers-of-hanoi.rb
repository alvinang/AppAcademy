class TowersOfHanoi

	def self.start

		@n = 0
		puts "------------------------------------------------------------------------"
		puts "Towers of HanooOoiiiii"
		puts " "
		puts "Your goal is to move all disk to peg 'c' in order. i.e. \"c\" => [3,2,1]"
		puts " "
		puts "------------------------------------------------------------------------"
		
		disk

		@hash = {}		
		@hash["a"] = (1..@pegs).to_a.reverse
		@hash["b"] = []
		@hash["c"] = []
		move

	end

	def self.disk

		print "How many disk do you want to play with? (Recommended for novice: 3):   "	
		# gets.chomp.is_a? Integer ? (@pegs = gets.chomp.to_i) : (puts "Please enter an integer"; disk)

		number_of_pegs = gets.chomp.to_i # returns 0 if not integer		

		if number_of_pegs > 0
			@pegs = number_of_pegs	
		else 
			puts "Please enter an integer"
			disk
		end

		
	end

	def self.move

		print "Move disk from peg (a, b or c) : "
		@old_location = gets.chomp.downcase

		print "to new peg location (a, b or c) : "
		@new_location = gets.chomp.downcase		

		if @hash[@new_location].empty? || @hash[@old_location].last < @hash[@new_location].last
			to_move = @hash[@old_location].pop
			@hash[@new_location] << to_move.to_i			
			@n += 1
			puts "Move #{@n}: #{@old_location} to #{@new_location}"	
			puts @hash
			puts " "
		else
			puts "Illegal Move: #{@hash[@new_location]} has a smaller disk"
			puts " "
		end

		check ? complete : move
		
	end

	def self.check

		check_array = (1..@pegs).to_a.reverse
		check_array == @hash["c"] ? true : false
		
	end

	def self.complete

		min_move = 2**@pegs - 1

		if @n < min_move
			puts "Completed in #{@n} steps. The absolute min is #{min_move}. You just did the impossible...are you from earth?"
		elsif @n == min_move
			puts "Completed in #{@n} steps. You are very efficient, congratulations!"
		else
			puts "You completed this in #{@n} steps. You might want to practice more - aim for #{min_move} :)"
		end

	end

end