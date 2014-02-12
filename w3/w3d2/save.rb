class SQLObject

  def save(id, columns)


    if id.nil?
      QuestionsDatabase.instance.execute(<<-SQL, columns)
      INSERT INTO
      users (columns)
      VALUES
      (?, ?, ?, ?)
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
    else
      QuestionsDatabase.instance.execute(<<-SQL, columns)
        UPDATE
        users
        SET (?, ?, ?, ?, ?)
        WHERE users.id = ?
        SQL
    end
  end

end