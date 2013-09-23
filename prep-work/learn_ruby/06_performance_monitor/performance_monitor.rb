# requires time library
# 1. take current time
# 2. run task
# 3. measure time difference

require 'time'
require 'debugger'

def measure(n = 1)
debugger
  time = Time.now
  n.times { yield }
  diff = (Time.now - time)/n # divisor to display average

end