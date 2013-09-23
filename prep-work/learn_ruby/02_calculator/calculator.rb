def add(num1, num2)
  num1 + num2
end


def subtract(num1, num2)
  num1 - num2
end


def sum(array)
  
  return 0 if array.empty?

  result = 0
  array.each do |n|
    result = result + n
  end

  result
end


def multiply(array)

  return 0 if array.empty?

  result = 1
  array.each do |n|
    result = result * n
  end

  result
end


def power(num,factor)
  num ** factor
end


def factorial(num)
  
  if num < 0
    puts "Please enter a positive number"
  elsif num == 0 || num == 1
    return 1
  end

  result = 1
  while num > 1
    result = result * num
    num -= 1
  end

  result
end
