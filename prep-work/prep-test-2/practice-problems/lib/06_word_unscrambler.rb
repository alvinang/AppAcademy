def word_unscrambler(str, words)
  str_letters = str.split("").sort # split words into characters and sort them alphabetically

  anagrams = []
  words.select do |word|
    word_letters = word.split("").sort
    anagrams << word if str_letters == word_letters
  end

  anagrams
end
