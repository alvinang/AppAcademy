require 'rspec'
require 'employee_manager.rb'


describe "Manager" do 
  subject(:manager) { Manager.new('Smith', 'manager', 185000, nil) }
    
  it 'should initialize with a name Smith' do 
    manager.salary.should == 185000
  end
    
  
  subject(:manager2) { Manager.new('Jeff', 'manager', 285000, manager) }
    
  it 'should initialize with a 285000 salary' do
    manager2.salary.should == 285000
  end

  subject(:e1) { Employee.new('Will', 'grunt', 30000, manager) }
  subject(:e2) { Employee.new('Alvin', 'programmer', 95000, manager) }
  subject(:e3) { Employee.new('Will2', 'awesome programmer', 200000, manager) }
  subject(:e4) { Employee.new('Tim', 'programmer', 65000, manager2) }
  subject(:e5) { Employee.new('Dan', 'awesome programmer', 95000, manager2) }   
   
  describe '#bonus(multiplier)' do 
      
    it 'calculates bonus for Will2' do
      expect(e3.bonus(2).should eq 400000)
    end
    
    it 'calculates bonus for Alvin' do
      expect(e2.bonus(2).should eq 190000)
    end
  end
  
  describe 'Manager#bonus' do
    
    it 'calculates bonus for the managers' do
      expect(manager2.bonus(3).should eq 480000)
    end
    
    it 'calclates bonus for top level manager' do
      expect(manager.bonus(1.5).should eq 1177500)
    end
  end    
end

    
# 
# m = Manager.new('Smith', 'manager', 185000, nil)
# e = Employee.new('John', 'supervisor', 20000, m);
# 
# p m
# p e
# 
# e1 = Employee.new('Will', 'grunt', 30000, m)
# e2 = Employee.new('Alvin', 'programmer', 95000, m)
# e3 = Employee.new('Will2', 'awesome programmer', 195000, m)
# 
# m2 = Manager.new('Jeff', 'manager', 285000, m)
# 
# e4 = Employee.new('Tim', 'programmer', 65000, m2)
# e5 = Employee.new('Dan', 'awesome programmer', 95000, m2)
# 
# puts "Employee bonus: #{e3.bonus(2.5)}"
# puts "Manager 1 bonus: #{m.bonus(1.5)}"
# puts "Manager 2 bonus: #{m2.bonus(3)}"