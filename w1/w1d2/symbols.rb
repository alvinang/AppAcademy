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