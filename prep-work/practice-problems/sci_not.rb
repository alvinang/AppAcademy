# Write a method `sci_not(num) that converts a positive number > 1
# into scientific notation rounded to 2 decimal places
# (e.g. `sci_not(234.5) == "2.35E2"` (use "E" instead of "10^")).
#
#describe "#sci_not" do
#  it "should convert a single-digit int" do
#    sci_not(3).should == "3.00E0"
#  end
#
#  it "should convert a simple integer" do
#    sci_not(11).should == "1.10E1"
#  end
#
#  it "should convert an integer" do
#    sci_not(12345).should == "1.23E4"
#  end
#
#  it "should convert a round-up situation" do
#    sci_not(1249).should == "1.25E3"
#  end
#end

def sci_not(number)
    return "#{number}.00E0" if number < 10
    answer = number.to_s
    counter = 0
    num_to_check = number
    
    while num_to_check > 10
        num_to_check /= 10.to_f
        counter += 1
    end
    
    get_last_num = ((number.to_f / (10**counter)).round(2).to_s)
    get_last_num[2].nil? ? (mid_num = 0) : (mid_num = get_last_num[2])
    get_last_num[3].nil? ? (last_num = 0) : (last_num = get_last_num[3])    
    
    return "#{answer[0]}.#{mid_num}#{last_num}E#{counter}"

end

# OR

def sci_not(int)    
    int = int.to_f
    power = 0
    while (int >= 10)
        int /= 10
        power += 1
    end
    
    answer = ""
    answer << int.to_s[0]
    answer << "."
    answer << (int * 10).to_s[1]
    answer << ((int * 100).round(3) % 10).to_s[3]
    answer << "E"
    answer << power.to_s
    answer
end
