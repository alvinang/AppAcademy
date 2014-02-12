class QuestionLike
  attr_reader :id, :user_id, :question_id

  def initialize(options = {})
    @id, @question_id, @user_id = options.values_at('id', 'question_id', 'user_id')
  end

  def self.all
    results = QuestionsDatabase.instance.execute("SELECT * FROM question_likes;")
    results.map { |result| QuestionLike.new(result) }
  end

  def self.likers_for_question_id(question_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
         u.id, u.fname, u.lname
       FROM
         question_likes ql
         JOIN users u ON ql.user_id = u.id
       WHERE
         ql.question_id = ?
       SQL

      results.map { |result| User.new(result) }
  end

  def self.num_likes_for_question_id(question_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
         COUNT(question_id)
       FROM
         question_likes
       WHERE
         question_id = ?
       GROUP BY
         question_id
       SQL

      results[0].values.last
  end

  def self.liked_questions_for_user_id(user_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
         q.id, q.title, q.body, q.user_id
       FROM
         questions q
         JOIN question_likes ql ON q.id = ql.question_id
       WHERE
         ql.user_id = ?
       SQL
      results.map { |result| Question.new(result) }
  end

  def self.most_liked_questions(n)
    results = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
         q.id, q.title, q.body, q.user_id
       FROM
         questions q
         JOIN question_likes ql ON q.id = ql.question_id
       GROUP BY
          q.id
       ORDER BY
          COUNT(q.id) DESC
       LIMIT
          ?
       SQL
      results.map { |result| Question.new(result) }
  end

end