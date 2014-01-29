class Student

  def initialize first_name, last_name
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end

  def name
    [@first_name, @last_name].join(' ')
  end

  def courses
    @courses
  end

  def course_names
    names = []
    @courses.each do |course|
      names << course.name
    end
  end

  def enroll course_obj
    conflicts = @courses.take_while { |course| course_obj.conflicts_with? course }
    if conflicts.empty?
      @courses << course_obj
      @courses.last.students << self
    else
      puts "There is a conflict, please try again"
    end
  end

  def course_load
    result = Hash.new{ 0 }
    @courses.each do |course|
      result[course.department] += course.credits
    end
    result
  end

end

class Course

  attr_accessor :students, :course_name, :department, :credits, :days, :time_block
  def initialize course_name, department, credits, days, time_block
    @course_name = course_name
    @department = department
    @credits = credits
    @students = []
    @days = days
    @time_block = time_block
  end

  def add_student student
    student.enroll self
  end

  def conflicts_with? second_course
    conflicts = false
    if second_course.time_block == self.time_block
      conflicts = true unless (second_course.days & self.days).empty?
    end
    conflicts
  end

end

#######################################
# Sample data if you need to run this #
#######################################

# s = Student.new("Andrew", "Marrone")
# c = Course.new("music 101", "music", 3, [:mon, :tue, :wed], 3)
# c2 = Course.new("music 201", "music", 3, [:fri], 3)