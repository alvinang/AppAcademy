def primes(num)
    return [] if num.nil? || num == 0
    return [2] if num == 1

    result = []
    result << 2    

    count = 1
    num_to_check = 3

    while count < num
        sq_rt_of_num = Math.sqrt(num_to_check)
        num_div_by = 2

        # number_div_by smaller than sqrt of num_to_check, increase num_div_by
        while num_div_by <= sq_rt_of_num
            break if (num_to_check % num_div_by == 0)
            num_div_by += 1
        end

        # this prevents any odd number that's not prime to enter result
        if num_div_by > sq_rt_of_num
            result << num_to_check 
            count += 1
        end

        num_to_check += 2
    end
    result
end

print primes(10)