def fibs(num)
	#return 0 or 1 arrays
	return [] if num == 0
	return [0] if num == 1
	return [0, 1] if num == 2

	#use [n-1] & [n-2] recursively to get fibs
	answer = [0, 1]
	until answer.size >= num
		length = answer.size
		answer << answer[length - 1] + answer[length - 2]
	end
	
	answer
end

