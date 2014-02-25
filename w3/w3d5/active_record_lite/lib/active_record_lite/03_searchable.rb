require_relative 'db_connection'
require_relative '02_sql_object'

module Searchable
  def where(params)    
    where_line = params.keys.map { |key| "#{key.to_s} = ?" }.join(" AND ")       
    searchable = DBConnection.execute(<<-SQL, params.values)
    SELECT
      #{table_name}.*
    FROM
      #{self.table_name}
    WHERE
      (#{where_line})
    SQL
    
    self.parse_all(searchable)
  end
end

class SQLObject
  extend Searchable
end
