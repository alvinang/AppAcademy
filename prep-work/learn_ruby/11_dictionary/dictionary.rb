# 1. Create dictionary class
# 2. methods includes add, entries, keywords, include?, find, printable

class Dictionary

  def initialize(hash = {})
    @hash = hash
  end

  def add(str)
    if str.class == String 
      @hash[str] = nil        # allow adding keyword w/o definition
    elsif str.class == Hash      
      @hash.merge!(str)       # merge it with existing hash 
    end
  end

  def entries
    @hash
  end

  def keywords
    keyword_array = []

    @hash.each do |key, val|
      keyword_array << key
    end

    keyword_array.sort
  end

  def include?(key)
    @hash.include?(key)
  end

  def find(str)
    output = {}
    length_index = str.split.length - 1
    # if hash key contain those letters in the same order, output value
    @hash.each do |key,val|
      output.merge! key => val if key[0..length_index] == str[0..length_index]
    end

    output
  end

  def printable
    output = []

    @hash.sort.each do |key,val|
      output << "[#{key}] \"#{val}\""
    end

   output.join("\n")
  end
  
end