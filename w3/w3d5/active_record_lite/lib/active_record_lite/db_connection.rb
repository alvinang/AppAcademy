require 'sqlite3'

# https://tomafro.net/2010/01/tip-relative-paths-with-file-expand-path
ROOT_FOLDER = File.join(File.dirname(__FILE__), "../..")
CATS_SQL_FILE = File.join(ROOT_FOLDER, "cats.sql")
CATS_DB_FILE = File.join(ROOT_FOLDER, "cats.db")

class DBConnection
  def self.open(db_file_name)
    @db = SQLite3::Database.new(db_file_name)
    @db.results_as_hash = true
    @db.type_translation = true

    @db
  end

  def self.reset
    commands = [
      "rm #{CATS_DB_FILE}",
      "cat #{CATS_SQL_FILE} | sqlite3 #{CATS_DB_FILE}"
    ]

    commands.each { |command| `#{command}` }
    DBConnection.open(CATS_DB_FILE)
  end

  def self.instance
    self.reset if @db.nil?

    @db
  end

  def self.execute(*args)
    puts args[0]

    self.instance.execute(*args)
  end

  def self.execute2(*args)
    puts args[0]

    self.instance.execute2(*args)
  end

  def self.last_insert_row_id
    self.instance.last_insert_row_id
  end

  private
  def initialize(db_file_name)
  end
end
