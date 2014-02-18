require 'launchy'
require 'oauth'
require 'addressable/uri'
require 'yaml'
require 'json'

class TwitterSession


  CONSUMER = OAuth::Consumer.new(
    TWITTER_CONSUMER_KEY, TWITTER_CONSUMER_SECRET, :site => "https://twitter.com")

  TOKEN_FILE = "access_token.yml"

  # Both `::get` and `::post` should return the parsed JSON body.
  def self.get(path, query_values)
    url = path_to_url(path, query_values)
    # access_token
    p url
    response = access_token.get(url).body
    parsed_response = JSON.parse(response)
    # p parsed_response
    # p "successfully fetched tweets"
  end

  def self.post(path, req_params)
    url = path_to_url(path, req_params)
    response = access_token.post(url).body
    parsed_response = JSON.parse(response)
  end

  def self.access_token
     # Load from file or request from Twitter as necessary. Store token
     # in class instance variable so it is repeatedly re-read from disk
     # unnecessarily.

     if File.exist?(TOKEN_FILE)
       # reload token from file
       File.open(TOKEN_FILE) { |f| YAML.load(f) }
     else
       # copy the old code that requested the access token into a
       # `request_access_token` method.
       access_token = request_access_token
       File.open(TOKEN_FILE, "w") { |f| YAML.dump(access_token, f) }

       access_token
     end
   end

   def self.request_access_token
     # Put user through authorization flow; save access token to file
     request_token = CONSUMER.get_request_token
     authorize_url = request_token.authorize_url

     puts "Go to this URL: #{authorize_url}"
     Launchy.open(authorize_url)

     puts "Login, and type your verification code in"
     oauth_verifier = gets.chomp
     access_token = request_token.get_access_token(
       :oauth_verifier => oauth_verifier
     )
   end

   def self.path_to_url(path, query_values = nil)
     # All Twitter API calls are of the format
     # "https://api.twitter.com/1.1/#{path}.json". Use
     # `Addressable::URI` to build the full URL from just the
     # meaningful part of the path (`statuses/user_timeline`)
     url = Addressable::URI.new(
       :scheme => "https",
       :host => 'api.twitter.com',
       :path => "1.1/#{path}.json",
       :query_values => query_values
     ).to_s
   end

end

