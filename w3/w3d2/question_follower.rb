class QuestionFollower
  attr_reader :id, :user_id, :question_id

  def initialize(options = {})
    @id, @question_id, @user_id = options.values_at('id', 'question_id', 'user_id')
  end

  def self.all
    results = QuestionsDatabase.instance.execute("SELECT * FROM question_followers;")
    results.map { |result| QuestionFollower.new(result) }
  end


  def self.most_followed_questions(n)

    query = <<-SQL
    SELECT q.id, q.title, q.body, q.user_id
    FROM questions q
    JOIN (SELECT question_id, count(question_id) c
              FROM question_followers
              GROUP BY question_id) q_counts
    WHERE q_counts.question_id = q.id
    ORDER BY q_counts.c DESC
    LIMIT ?

    SQL
    results = QuestionsDatabase.instance.execute(query, n)
    results.map { |result| Question.new(result) }

  end
  def self.followers_for_question_id(id)
    results = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
         u.id, u.fname, u.lname
       FROM
         question_followers q
         JOIN users u ON q.user_id = u.id
       WHERE
         q.question_id = ?
       SQL

      results.map { |result| User.new(result) }
  end

  def self.followed_questions_for_user_id(user_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        q.id, q.title, q.body, q.user_id
       FROM
         question_followers qf
         JOIN questions q ON qf.question_id = q.id
       WHERE
         qf.user_id = ?
       SQL
      results.map { |result| Question.new(result) }
  end


end
