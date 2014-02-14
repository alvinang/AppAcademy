# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create!(:user_name => 'minh')
u2 = User.create!(:user_name => 'alvin')

p1 = Poll.create!(:title => "FOOD!", :author_id => u1.id)
p2 = Poll.create!(:title => "COLORS!", :author_id => u2.id)

q1 = Question.create!(:text => "What is your favorite cuisine?", :poll_id => p1.id)
q2 = Question.create!(:text => "What is your favorite restaurant?", :poll_id => p1.id)

ac1 = AnswerChoice.create!(:text => "Vietnamese", :question_id => q1.id)
ac2 = AnswerChoice.create!(:text => "Chinese", :question_id => q1.id)
ac3 = AnswerChoice.create!(:text => "Italian", :question_id => q1.id)
ac4 = AnswerChoice.create!(:text => "French", :question_id => q1.id)

ac5 = AnswerChoice.create!(:text => "Pizza Hut!", :question_id => q2.id)

r1 = Response.create!(:user_id => u2.id, :answer_choice_id => ac2.id)
r2 = Response.create!(:user_id => u1.id, :answer_choice_id => ac4.id)

