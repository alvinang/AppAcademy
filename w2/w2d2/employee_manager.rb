class Employee

  attr_reader :salary

  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
    boss.add_employee(self) unless boss.nil?
  end

  def bonus(multiplier)
    @salary * multiplier
  end

end

class Manager < Employee

  def initialize(name, title, salary, boss)
    @employee = []
    super
  end

  def bonus(multiplier)
    total = @employee.inject(0) do |sum, employee|
      if employee.is_a?(Manager)
        sum += employee.salary + employee.employees_total
      else
        sum + employee.salary
      end
    end
    total * multiplier
  end

  def employees_total
    @employee.inject(0) do |sum, employee|
      if employee.is_a?(Manager)
        sum += employee.salary + employee.employees_total
      else
        sum + employee.salary
      end
    end
  end

  def add_employee(employee)
    @employee << employee
  end

end