# Write a set of classes to model Students and Courses.
# 
# Student#initialize should take a first and last name.
# Student#name should return the concatenation of the student's first and last name.
# Student#courses should return a list of the Courses in which the student is enrolled.
# Student#enroll should take a Course object, add it to the student's list of courses, and update the Course's l
# ist of enrolled students.
# enroll should ignore attempts to re-enroll a student.
# Student#course_load should return a hash of departments to # of credits the student is taking in that department.
# Course#initialize should take the course name, department, and number of credits.
# Course#students should return a list of the enrolled students.
# Course#add_student should add a student to the class.
# Probably can rely upon Student#entroll.
# And some extras:
# 
# Each course should also take a set of days of the week (:mon, :tue, ...), plus a time block (assume each day is broken into 8 consecutive time blocks). So a course could meet [:mon, :wed, :fri] during block #1.
# Update your #initialize method to also take a time block and days of the week.
# Write a method Course#conflicts_with? which takes a second Course and returns true if they conflict.
# Update Student#enroll so that you raise an error if a Student enrolls in a new course that conflicts with an existing course time.
# May want to write a Student#has_conflict? method to help.

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