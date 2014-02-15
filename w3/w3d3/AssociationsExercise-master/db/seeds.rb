User.create(:name => "CJ")
User.create(:name => "Flarnie")
User.create(:name => "Jeff")
User.create(:name => "Georges St. Pierre")
User.create(:name => "Ned")

Course.create(:name => "Ruby 101", :instructor_id => 5)
Course.create(:name => "Ruby 102", :instructor_id => 5, prereq_id: 1)

Enrollment.create(:student_id => 3, :course_id => 1)
Enrollment.create(:student_id => 4, :course_id => 1)
Enrollment.create(:student_id => 1, :course_id => 2)
Enrollment.create(:student_id => 2, :course_id => 2)
