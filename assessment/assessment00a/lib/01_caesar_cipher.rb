def caesar_cipher(str, shift)
    letters_array = ("a".."z").to_a 
    str_array = str.split("")
    answer = []

    # take string, if not " ", process then modulus 26 in case > z
    str_array.map do |n|
        n == " " ? answer << n : answer << letters_array[( letters_array.find_index(n) + shift ) % 26]
    end

    answer.join
end

