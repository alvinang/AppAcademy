require_relative '03_searchable'
require 'active_support/inflector'

# Phase IVa
class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key,
  )

  def model_class
    self.class_name.constantize
  end

  def table_name
    self.model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    defaults = {
      :class_name => name.to_s.camelcase.singularize,
      :foreign_key => "#{name.to_s.singularize}_id",
      :primary_key => :id
    }
        
    options = defaults.merge(options)    
    self.foreign_key = options[:foreign_key].to_sym
    self.class_name = options[:class_name]
    self.primary_key = options[:primary_key]
    
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})
    defaults = {
      :class_name => name.to_s.camelcase.singularize,
      :foreign_key => "#{self_class_name.to_s.singularize.downcase}_id",
      :primary_key => :id
    }
        
    options = defaults.merge(options)    
    self.foreign_key = options[:foreign_key].to_sym
    self.class_name = options[:class_name]
    self.primary_key = options[:primary_key]
  end
end

module Associatable
  # Phase IVb
  def belongs_to(name, options = {})
    options = BelongToOptions.new(name, options)
    define_method(name) do
      foreign_key = self.send(options.foreign_key)
      options.model_class = options.model_class           
      options.where(:id => foreign_key).first             
    end
  end

  def has_many(name, options = {})
    # ...
  end

  def assoc_options
    # Wait to implement this in Phase V. Modify `belongs_to`, too.
  end
end

class SQLObject
  extend Associatable
  extend Searchable
  # Mixin Associatable here...
end
