# You've written an RPN calculator. Practice by rewriting your version better than you had before. It should have a user interface which reads from standard input one operand or operator at a time. You should be able to invoke it as a script from the command line. You should be able to, optionally, give it a filename on the command line, in which case it opens and reads that file instead of reading user input.

class RPNCalculator

  def initialize
    @num_stack = []
  end

  def push num
    @num_stack.push num
  end

  def tokens string
    string.split.map! { |token| token[/\d/] ? token.to_i : token.to_sym }
  end

  def evaluate string
    tokens(string).each do |key|
      case key
      when Fixnum
        push key
      when :+
        plus
      when :-
        minus
      when :*
        times
      when :/
        divide
      end
    end
    value
  end

  def plus
    raise "calculator is empty" unless @num_stack.size >= 2
    @num_stack.push @num_stack.pop(2).inject(:+)
  end

  def minus
    raise "calculator is empty" unless @num_stack.size >= 2
    @num_stack.push @num_stack.pop(2).inject(:-)
  end

  def times
    raise "calculator is empty" unless @num_stack.size >= 2
    @num_stack.push @num_stack.pop(2).inject(:*)
  end

  def divide
    raise "calculator is empty" unless @num_stack.size >= 2
    @num_stack.push @num_stack.pop(2).inject(:fdiv)
  end

  def value
    @num_stack[-1]
  end

  def get_user_input
    input = gets.chomp
    puts self.evaluate input
  end

  def get_file_input filename
    # remove .txt if exists
    filename = filename.sub(/\.\w*$/,'')
    
    File.foreach("#{filename}.txt") do |line|
      puts evaluate(line.chomp)
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  calculator = RPNCalculator.new

  if ARGV.empty?
    calculator.get_user_input
  else
    calculator.get_file_input ARGV[0]
  end
end
