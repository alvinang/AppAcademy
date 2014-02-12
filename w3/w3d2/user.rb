class User
  def self.all
    results = QuestionsDatabase.instance.execute("SELECT * FROM users;")
    results.map { |result| User.new(result) }
  end

  attr_accessor :id, :fname, :lname

  def initialize(option = {})


    @id = option["id"]
    @fname = option["fname"]
    @lname = option["lname"]
  end

  def self.find_by_id(id)
    query = "SELECT * FROM users WHERE id = ?;"
    user_data = QuestionsDatabase.instance.execute(query, id)
    User.new(user_data[0])
  end

  def self.find_by_name(fname, lname)
    query = "SELECT * FROM users WHERE fname = ? AND lname = ?;"
    user_data = QuestionsDatabase.instance.execute(query, fname, lname)
    User.new(user_data[0])
  end

  def save
    if self.id.nil?
      QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
      INSERT INTO
      users (fname, lname)
      VALUES
      (? , ? )
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
    else
      QuestionsDatabase.instance.execute(<<-SQL, @id, @fname, @lname)
        UPDATE
        users
        SET (? , ?)
        WHERE users.id = ?
        SQL
    end
  end

  def sql_columns
    [:id, :fname, :lname]
  end

  def authored_questions
    questions = Question.find_by_author_id(self.id)
  end

  def authored_replies
    replies = Reply.find_by_user_id(self.id)
  end

  def fname
    @fname
  end

  def followed_questions
    QuestionFollower.followed_questions_for_user_id(self.id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(self.id)
  end

  def average_karma
    query = <<-SQL
     SELECT sum(q_counts.c)/count(q_counts.ID)
     FROM users u JOIN
       (SELECT ql.question_id as ID, COUNT(ql.question_id) AS c
       FROM questions q
       JOIN question_likes ql ON q.id = ql.question_id
       GROUP BY ql.question_id
       ) q_counts
       WHERE u.id = ?
    SQL
  user_karma = QuestionsDatabase.instance.execute(query, self.id)
  user_karma.first.values.first
  end
end















