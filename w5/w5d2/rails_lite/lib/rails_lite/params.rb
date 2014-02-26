require 'uri'

class Params
  # use your initialize to merge params from
  # 1. query string
  # 2. post body
  # 3. route params
  def initialize(req, route_params = {})  
    @req = req
    @route_params = route_params
    @params = {}
    parse_www_encoded_form(@req.query_string)
    parse_www_encoded_form(@req.body)    
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
    return nil if www_encoded_form.nil?
    params = {}
    key_value_hashs = URI::decode_www_form(www_encoded_form)

    key_value_hashs.each do |keys, value|
      current_hash = @params

      keys_array = parse_key(keys)
      keys_array.each do |key|
        if key == keys_array.last
          current_hash[key] = value
        else
          current_hash[key] ||= {}
          current_hash = current_hash[key]
        end
      end
    end

    params    
  end

  # this should return an array
  # user[address][street] should return ['user', 'address', 'street']
  def parse_key(key)
    key.split(/\]\[|\[|\]/)
  end
end
