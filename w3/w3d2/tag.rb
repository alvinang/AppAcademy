class Tag

  attr_accessor :name, :id

  def initialize(options = {})
    @id, @name = options.values_at('id', 'name')
  end

  def self.all
    results = QuestionsDatabase.instance.execute("SELECT * FROM tags;")
    results.map { |result| Tag.new(result) }
  end

  def self.find_by_tag_id(id)
    query = "SELECT * FROM tags WHERE id = 1;"
    replies = QuestionsDatabase.instance.execute(query)
    Tag.new(replies[0])
  end

  def most_popular_question(n)
    query = <<-SQL
    SELECT q1.id, q1.title, q1.body, q1.user_id
                   FROM questions q1 join
                      (SELECT q.id ID, COUNT(q.id) c
                      FROM questions q
                      JOIN question_tags qt
                      ON q.id = qt.question_id
                      WHERE qt.tag_id = ?
                      GROUP BY q.id) q_count ON q_count.ID = q1.id
                      ORDER BY q_count.c DESC
                      LIMIT ?
    SQL

    most_pop = QuestionsDatabase.instance.execute(query, self.id, n)
  end

  def self.most_popular(n)
    query = <<-SQL
      SELECT t.id, t.name
      FROM tags t JOIN
        (SELECT qt.tag_id ID, COUNT(qt.tag_id) c
        FROM questions q JOIN question_likes ql ON q.id = ql.question_id
        JOIN question_tags qt ON qt.question_id = q.id
        GROUP BY qt.tag_id) q_count ON q_count.ID = t.id
        ORDER BY q_count.c DESC
        LIMIT ?
    SQL

    most_popular_likes = QuestionsDatabase.instance.execute(query, n)
  end

end