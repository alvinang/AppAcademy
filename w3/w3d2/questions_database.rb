require 'singleton'
require 'sqlite3'
require './reply'
require './question_follower'
require './user'
require './question'
require './question_like'
require './tag'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super("questions.db")

    self.results_as_hash = true
    self.type_translation = true
  end
end































