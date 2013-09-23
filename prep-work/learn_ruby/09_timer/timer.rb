# 1. Get time in seconds
# 2. Use modulus to determine if more than 60 seconds
# 3. Create helper method to pad value < 10 seconds
# 4. Replicate for minutes and hours

require 'time'

class Timer
  attr_accessor :seconds

  def initialize
    @seconds = 0
  end
    
  def time_string
    sec = @seconds % 60
    display_sec = padded(sec)

    if seconds >= 3600
      display_min = padded((@seconds / 60) - 60)
      display_hour = padded(seconds / 3600)
    elsif seconds < 3600 || seconds >= 60
      display_min = padded(@seconds / 60)
      display_hour = "00"
    else
      display_min = "00"
      display_hour = "00"
    end

    display = display_hour + ":" + display_min + ":" + display_sec        
    
  end

  def padded(num)  
    num < 10 ? (output = "0" + num.to_s) : (output = num.to_s)
    output
  end

end