class Question
  def self.all
    results = QuestionsDatabase.instance.execute("SELECT * FROM questions;")
    results.map { |result| Question.new(result) }
  end

  attr_accessor :id, :title, :body, :user_id

  def initialize(option = {})
    @id = option["id"]
    @title = option["title"]
    @body = option["body"]
    @user_id = option["user_id"]
  end

  def self.find_by_author_id(id)
    query = "SELECT * FROM questions WHERE user_id = ?;"
    questions = QuestionsDatabase.instance.execute(query, id)
    questions.map { |question_data| Question.new(question_data) }
  end

  def self.most_followed(n)
    QuestionFollower.most_followed_question(n)
  end

  def save
    if self.id.nil?

      QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @user_id)
        INSERT INTO
        users (title, body, user_id)
        VALUES
        (? , ? , ?)
        SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
    else
      QuestionsDatabase.instance.execute(<<-SQL, @id, @title, @body, @user_id)
        UPDATE
        users
        SET (? , ? , ?)
        WHERE users.id = ?
        SQL
    end
  end

  def author
    query = "SELECT fname, lname FROM users WHERE user_id = ?;"
    author = QuestionsDatabase.instance.execute(query, self.user_id)
  end

  def replies
    replies = Reply.find_by_question_id(self.id)
    # query = "SELECT * FROM replies WHERE question_id = ?;"
 #    replies = RepliesDatabase.instance.execute(query)
  end

  def followers
    QuestionFollower.followers_for_question_id(self.id)
  end

  def likers
    QuestionLike.likers_for_question_id(self.id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(self.id)
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

end
