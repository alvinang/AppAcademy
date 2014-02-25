# def name=(name)
#   @name = name
# end
# 
# def name
#   @name
# end
# define_method takes a string

class AttrAccessorObject
  def self.my_attr_accessor(*names)
    
    names.each do |name|
      define_method("#{name}=") do |arg| 
        instance_variable_set("@#{name}", arg)
      end
    
      define_method(name.to_s) do 
        instance_variable_get("@#{name}")
      end
    end
  end
end
