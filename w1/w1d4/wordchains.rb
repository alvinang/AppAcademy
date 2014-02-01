# word must be in dictionary
# change 1 letter each time
# to get to final word
# print error message if no word found

class ReachableWords
    
  def initialize(start_word, target)
    @words_to_expand = File.readlines('dictionary.txt') { |line| line.chomp }
    @candidate_words = @words_to_expand.select { |word| word == target.length }
    @all_reachable_words = # just contain the source of all reachable words
  end
  
  # start looping, remove a word from @words_to_expand each turn.
  # run it through adjacent words, using @candidate_words dictionary
  # foreach adjacent words, remove @candidate_words
  # add adjacent words to @words_to_expand and @all_reachable_words
  # continue looping until no words left to expand
  
  # all words that can be reached through a chain from a given starting word
  def explore_words(source, dictionary)
        
  

  end


  # helper method, return words from dictionary that differ by one letter
  def adjacent_words(word, dictionary)    
    one_letter_diff = []
    @words_to_expand.each do |similar_word|
      (similar_word.length).times do 
        one_letter_diff <<  
  end

end