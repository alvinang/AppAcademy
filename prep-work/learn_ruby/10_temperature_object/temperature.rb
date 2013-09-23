# 1. Create temperature class
# 2. Initilize hash and ensure that it recognizes :f and :c
# 3. In initializer, 

class Temperature

  # Initialize & process hash to process F and C to be used by other methods
  def initialize(hash = {})
    if hash.include?(:f)
      @f_temp = hash[:f]
      @c_temp = ftoc(hash[:f])
    elsif hash.include?(:c)
      @c_temp = hash[:c]
      @f_temp = ctof(hash[:c])
    end
  end

  # Factory Methods allows for direct usage of from_celsius/fahrenheit method
  def self.from_celsius(temp)
    Temperature.new(:c => temp)
  end

  def self.from_fahrenheit(temp)
    Temperature.new(:f => temp)
  end

  def in_celsius
    @c_temp
  end

  def in_fahrenheit
    @f_temp
  end

  # obtained equations from 01_temperature
  def ftoc(temp)
    (temp-32) / 9 * 5.0
  end

  def ctof(temp)
    (temp * 9 / 5.0) + 32
  end
end

# Create Celsius and Fahrenheit class to inherit from temperature
class Celsius < Temperature
  def initialize(temp)
    super(:c => temp) # Inherit everything under def initialize from Temperature class
  end
end

class Fahrenheit < Temperature
  def initialize(temp)
    super(:f => temp)
  end
end