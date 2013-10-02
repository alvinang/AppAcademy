#Implement a Caesar cipher. Example: caesar("hello", 3) # => "khoor"
#Assume the text is all lower case letters.
#You'll probably want to map letters to numbers (so you can shift them). You can do this 
#mapping yourself, but you may also want to use the ASCII codes, which are accessible 
#through String#each_byte.
#You will probably also want to use String#ord and Fixnum#chr.
#Important point: ASCII codes are all consecutive!
#Lastly, be careful of the letters at the end of the alphabet, like "z"!


def caesar_cipher(string, num)
    result = []
    new_byte = 0
    
    string.each_byte do |byte|
        new_byte = byte + num
        if new_byte > 122
            new_byte = new_byte - 26
        end        
        
        result << new_byte.chr
    end
    result.join
end

# OR

def caesar_cipher(str, shift)
    letters_array = ("a".."z").to_a # create array of letters   
    
    str.split("").map do |char|
        char == " " ? char : letters_array[( letters_array.index(char) + shift ) % 26]
    end.join
end
