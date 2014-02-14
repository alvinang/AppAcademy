require_relative 'db_connection'
require_relative '01_mass_object'
require 'active_support/inflector'

class MassObject
  def self.parse_all(results)
    # ...
  end
end

class SQLObject < MassObject
  def self.columns
    # ...
  end

  def self.table_name=(table_name)
    # ...
  end

  def self.table_name
    # ...
  end

  def self.all
    # ...
  end

  def self.find(id)
    # ...
  end

  def attributes
    # ...
  end

  def insert
    # ...
  end

  def initialize
    # ...
  end

  def save
    # ...
  end

  def update
    # ...
  end

  def attribute_values
    # ...
  end
end
