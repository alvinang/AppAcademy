require_relative 'db_connection'
require_relative '01_mass_object'
require 'active_support/inflector'

class MassObject
  def self.parse_all(results)    
    results.map do |result|
      self.new(result)
    end
  end
end

class SQLObject < MassObject
  
  def self.columns
    columns_array = 
      DBConnection.execute2(<<-SQL).first
      SELECT *
      FROM #{self.table_name}
      SQL

    columns_array.each do |col|
      define_method("#{col.to_s}=") do |arg| 
        attributes[col.to_sym] = arg
      end
  
      define_method(col.to_s) do 
        attributes[col.to_sym]
      end
    end
    
    columns_array.map(&:to_sym)    
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.to_s.underscore.pluralize
  end

  def self.all
    all_data = DBConnection.execute(<<-SQL)
    SELECT #{ table_name }.*
    FROM #{self.table_name}
    SQL
    
    self.parse_all(all_data)
  end

  def self.find(id)
    
    find_by_id = DBConnection.execute(<<-SQL, id)
      SELECT 
      #{table_name}.*
      FROM #{self.table_name}
      WHERE #{self.table_name}.id = ?
      LIMIT 1
    SQL
      
    self.parse_all(find_by_id).first
  end

  def attributes
    @attributes ||= {}
  end

  def insert
    col_names = self.attributes.keys.join(", ")
    question_mark = (["?"] * self.attributes.keys.count).join(", ")
    
    DBConnection.execute(<<-SQL, *attribute_values)
    INSERT INTO
      #{self.class.table_name} (#{col_names})
    VALUES
      (#{question_mark})
    SQL
    
    self.id = DBConnection.last_insert_row_id
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      name_sym = attr_name.to_sym
      attributes[name_sym] = value
      raise "unknown attribute #{attr_name}" unless self.class.columns.include?(name_sym)                  
    end    
  end

  def save
    self.id.nil? ? self.insert : self.update
  end

  def update
    set_line = self.class.columns
        .map { |attr| "#{ attr } = ?"}.join(", ")
    
    DBConnection.execute(<<-SQL, *attribute_values)
    UPDATE
      #{self.class.table_name}
    SET
      #{set_line} 
    WHERE
      #{self.class.table_name}.id = #{self.id}
    SQL
        
  end

  def attribute_values
    self.attributes.values
  end
end
