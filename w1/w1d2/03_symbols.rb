# Write a method super_print that takes a String. This method should take optional parameters :times, 
# :upcase, and :reverse with reasonable default values. For example:
# 
# super_print("Hello")                                    #=> "Hello"
# super_print("Hello", :times => 3)                       #=> "Hello" 3x
# super_print("Hello", :upcase => true)                   #=> "HELLO"
# super_print("Hello", :upcase => true, :reverse => true) #=> "OLLEH"

def super_print string, options={}

  defaults = {
    :times => 1,
    :upcase => false,
    :reverse => false
  }

  options = defaults.merge(options)

  options[:times].times do |time|
    string_copy = string

    string_copy.upcase! if options[:upcase]
    string_copy.reverse! if options[:reverse]

    puts string_copy
  end

end