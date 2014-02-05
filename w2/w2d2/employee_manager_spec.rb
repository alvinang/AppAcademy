require './employee_manager.rb'

m = Manager.new('Smith', 'manager', 185000, nil)
e = Employee.new('John', 'supervisor', 20000, m);

p m
p e

e1 = Employee.new('Will', 'grunt', 30000, m)
e2 = Employee.new('Alvin', 'programmer', 95000, m)
e3 = Employee.new('Will2', 'awesome programmer', 195000, m)

m2 = Manager.new('Jeff', 'manager', 285000, m)

e4 = Employee.new('Tim', 'programmer', 65000, m2)
e5 = Employee.new('Dan', 'awesome programmer', 95000, m2)

puts "Employee bonus: #{e3.bonus(2.5)}"
puts "Manager 1 bonus: #{m.bonus(1.5)}"
puts "Manager 2 bonus: #{m2.bonus(3)}"
