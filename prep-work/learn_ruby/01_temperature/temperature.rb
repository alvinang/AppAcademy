# cannot use 5/9 * (temp - 32) because 5/9 = 0
# using 9.0/5.0 to obtain floating point due to be_within(0.1) spec

def ftoc(temp)
  celsius = (temp - 32) * 5.0/9.0 
end

def ctof(temp)
  fahrenheit = (temp * 9.0/5.0) + 32  
end