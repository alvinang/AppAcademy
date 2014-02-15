require_relative 'db_connection'
require_relative '02_sql_object'

module Searchable
  def where(params)
    
    where_line = []
    params.keys.each do |key|
      where_line << "#{key.to_s} = ?"
    end    
    where_line = where_line.join(" AND ")    
    
    params_val = params.values    
    searchable = DBConnection.execute(<<-SQL, params_val)
    SELECT
      *
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
