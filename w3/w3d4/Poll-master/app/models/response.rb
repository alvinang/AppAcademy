# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#

class Response < ActiveRecord::Base

  validates :user_id, :answer_choice_id, :presence => true
  validate :respondent_has_not_already_answered_question
  validate :author_cannot_vote_for_itself

  belongs_to(
  :answer_choice,
  :class_name => "AnswerChoice",
  :foreign_key => :answer_choice_id,
  :primary_key => :id
  )

  belongs_to(
  :respondent,
  :class_name => "User",
  :foreign_key => :user_id,
  :primary_key => :id
  )

  has_one :question, :through => :answer_choice, :source => :question

  has_one :poll, :through => :question, :source => :poll

  has_many :uncle_answer_choices, :through => :question, :source => :answer_choices

  has_many :cousin_responses, :through => :uncle_answer_choices, :source => :responses

  def respondent_has_not_already_answered_question
    result = existing_responses
    unless result.empty? || (result.count == 1 && result.first.user_id = self.id)
      errors.add(:voting_error, "You cannot vote twice!")
    end
  end

  def author_cannot_vote_for_itself
    if self.answer_choice.question.poll.author.id == self.user_id
      errors.add(:voting_error, "You cannot vote for yourself!")
    end
  end


  private
  def existing_responses
    Response.find_by_sql([<<-SQL, self.user_id, self.answer_choice_id])
    SELECT *
    FROM responses JOIN answer_choices ON responses.answer_choice_id = answer_choices.id
    WHERE responses.user_id = ? AND answer_choices.question_id = (SELECT questions.id
      FROM questions JOIN answer_choices ON questions.id = answer_choices.question_id
      WHERE answer_choices.id = ?)
    SQL
  end

end
