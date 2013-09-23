# 1. Create RPNCalculator class
# 2. methods include: push, plus, value, minus, divide, times, evaluate
# 3. raise error "calculator is empty" for no value

class RPNCalculator
  attr_accessor :calculator

  def initialize
    @calculator = []
  end

  def push(num)
    @calculator << num
  end

  def value
    @value
  end

  def plus
    raise "calculator is empty" if @calculator.empty?
    @last_pushed_num = @calculator.pop
    @calculator[-1] += @last_pushed_num    # store plus value using FIFO method to the last of array calculator
    @value = @calculator[-1]
  end

  def minus
    raise "calculator is empty" if @calculator.empty?
    @last_pushed_num = @calculator.pop
    @calculator[-1] -= @last_pushed_num
    @value = @calculator[-1]
  end

  def divide
    raise "calculator is empty" if @calculator.empty?
    @last_pushed_num = @calculator.pop
    @calculator[-1] = @calculator.last.to_f / @last_pushed_num
    @value = @calculator[-1]
  end

  def times
    raise "calculator is empty" if @calculator.empty?
    @last_pushed_num = @calculator.pop.to_f
    @calculator[-1] = @calculator.last.to_f * @last_pushed_num
    @value = @calculator[-1]
  end

  # take input, output array with integers and symbols
  def tokens(x)
    token_array = []

    x.split.each do |z| 
      if z[/\d+/] # if number
        token_array << z.to_i
      elsif z[/(\+|\-|\*|\/)/] # if one of those operators
        token_array << z.to_sym
      end
    end

    token_array
  end

  # use tokens to generate array. Evaluate with methods when symbols are found
  def evaluate(x)
    tokens(x).each do |value| 
      if value.is_a? Integer
        push(value)
      elsif value.is_a? Symbol
        plus if value == :+
        minus if value == :-
        times if value == :*
        divide if value == :/
      end
    end

    @value
  end
  
end