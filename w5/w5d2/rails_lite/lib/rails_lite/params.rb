require 'uri'

class Params
  # use your initialize to merge params from
  # 1. query string
  # 2. post body
  # 3. route params
  def initialize(req, route_params = {})  
    @params = {}
    parse_www_encoded_form(req.body)
    # query = URI.decode_www_form(req.query_string)
    # parse_www_encoded_form(query)    
    
  end

  def [](key)
    @params[key]
  end

  def permit(*keys)
  end

  def require(key)
  end

  def permitted?(key)
  end

  def to_s
  end

  class AttributeNotFoundError < ArgumentError; end;

  private
  # this should return deeply nested hash
  # argument format
  # user[address][street]=main&user[address][zip]=89436
  # should return
  # { "user" => { "address" => { "street" => "main", "zip" => "89436" } } }
  def parse_www_encoded_form(www_encoded_form)
    {}.tap do |hash|
      decoded_form = URI.decode_www_form(www_encoded_form)

      decoded_form.each do |key, value|
        keys = parse_key(key)
        nested_hash = hash

        keys.each_with_index do |nested_key, index|
          if index + 1 == keys.count
            nested_hash[nested_key] = value
          else
            nested_hash[nested_key] ||= {}
            nested_hash = nested_hash[nested_key]
          end
        end
      end

      # @params = {}
      # new_split = www_encoded_form.split("&").map{|sub| sub.split("=")}    
      # new_split.each {|hash| @params[hash.first] = hash.last}
      # 
      # new_hash = {}
      # 
      # @params.each do |key, value|
      #   

    end
    
  end

  # this should return an array
  # user[address][street] should return ['user', 'address', 'street']
  def parse_key(key)
    key.split(/\]\[|\[|\]/)
  end
end
