class Reply
  attr_reader :id, :question_id, :parent_id, :user_id, :body

  def initialize(option = {})
    @id = option["id"]
    @question_id = option["question_id"]
    @parent_id = option["parent_id"]
    @user_id = option["user_id"]
    @body = option["body"]
  end

  def self.all
    results = QuestionsDatabase.instance.execute("SELECT * FROM replies;")
    results.map { |result| Reply.new(result) }
  end

  def self.find_by_question_id(id)
    query = "SELECT * FROM replies WHERE question_id = ?;"
    replies = QuestionsDatabase.instance.execute(query, id)
  end

  def self.find_by_user_id(id)
    query = "SELECT * FROM replies WHERE user_id = ?;"
    replies = QuestionsDatabase.instance.execute(query, id)
  end

  def author
    query = "SELECT fname, lname FROM users WHERE user_id = ?;"
    author = QuestionsDatabase.instance.execute(query, self.user_id)
  end

  def question
    query = "SELECT title FROM question WHERE id = ?;"
    author = QuestionsDatabase.instance.execute(query, self.question_id)
  end

  def parent_reply
    query = "SELECT body FROM replies WHERE id = ?;"
    parent = QuestionsDatabase.instance.execute(query, self.parent_id)
  end

  def child_replies
    query = "SELECT body FROM replies WHERE parent_id = ?;"
    children = QuestionsDatabase.instance.execute(query, self.id)
  end

  def save
    if self.id.nil?
      QuestionsDatabase.instance.execute(<<-SQL, @question_id, @parent_id, @user_id, @body)
      INSERT INTO
      users (question_id, parent_id, user_id, body)
      VALUES
      (?, ?, ?, ?)
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
    else
      QuestionsDatabase.instance.execute(<<-SQL, @question_id, @parent_id, @user_id, @body, @id)
        UPDATE
        users
        SET (?, ?, ?, ?, ?)
        WHERE users.id = ?
        SQL
    end
  end
end