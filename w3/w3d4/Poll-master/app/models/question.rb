# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  poll_id    :integer          not null
#  text       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base

  validates :text, :poll_id, :presence => true

  belongs_to(
  :poll,
  :class_name => "Poll",
  :foreign_key => :poll_id,
  :primary_key => :id
  )

  has_many(
  :answer_choices,
  :class_name => "AnswerChoice",
  :foreign_key =>  :question_id,
  :primary_key => :id,
  :dependent => :destroy
  )

  has_many :responses, :through => :answer_choices, :source => :responses

  def results
    # select_sql = <<-SQL
    #       answer_choices.*,
    #       COUNT(responses.id) AS response_count
    #     SQL
    #
    #     responses_joins_sql = <<-SQL
    #       LEFT OUTER JOIN
    #         responses ON answer_choices.id = responses.answer_choice_id
    #     SQL
    #
    #     answer_choices = AnswerChoice
    #       .select(select_sql)
    #       .joins(:question)
    #       .joins(responses_joins_sql)
    #       .where("questions.id = ?", self.id)
    #       .group("answer_choices.id")
    #
    #     {}.tap do |results|
    #       answer_choices.each do |answer_choice|
    #         results[answer_choice.text] = Integer(answer_choice.response_count)
    #       end
    #     end

    results = AnswerChoice.find_by_sql([<<-SQL, self.id])
    SELECT
    answer_choices.text, COUNT(responses.id) AS vote_count
    FROM
    answer_choices JOIN questions ON questions.id = answer_choices.question_id
    LEFT OUTER JOIN responses ON answer_choices.id = responses.answer_choice_id
    WHERE
    questions.id = ?
    GROUP BY
    answer_choice_id
    SQL

    hash = Hash.new(0)
    results.map do |result|
      hash[result.text] = Integer(result.vote_count)
    end
    hash
  end
end
