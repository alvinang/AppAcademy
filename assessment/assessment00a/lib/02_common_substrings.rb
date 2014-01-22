def common_substrings(str1, str2)
    length1 = str1.length
    str1_array = str1.chars
    check_array = []
    result = []
    
    # get all possible consecutive combination
    (3..length1).each do |x|
        str1_array.each_cons(x) { |word| check_array << word.join }
    end
    
    # check all possible combination if includes in str2
    check_array.each do |to_check|
        result << to_check if str2.include? to_check
    end
    
    # sort substring and get last (longest)
    result[0].nil? ? "" : result.sort.last

end