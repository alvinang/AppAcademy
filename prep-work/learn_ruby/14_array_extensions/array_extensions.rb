class Array

  def sum
    return 0 if self.empty?
    result = 0
    self.each { |x| result += x }

    result  
  end


  def square
    return self if self.empty?      
    self.map { |x| x ** 2 }
  end


  def square!
    return self if self.empty?
    self.map! { |x| x ** 2 }       
  end

end