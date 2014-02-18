require 'json'

class User < ActiveRecord::Base
  has_many :statuses,
           :class_name => "Status",
           :foreign_key => :twitter_user_id,
           :primary_key => :twitter_user_id

  def self.fetch_by_screen_name!(screen_name)
    user_id = find_user_id(screen_name)
    Status.fetch_by_twitter_user_id!(user_id)
    User.create(:twitter_user_id => user_id,
                :screen_name => screen_name
    )
  end

  def self.get_by_screen_name(screen_name)
    user_id = find_user_id(screen_name)
    Status.get_by_twitter_user_id(user_id)
    User.create(:twitter_user_id => user_id,
                :screen_name => screen_name
    )
  end

  def self.parse_twitter_user(screen_name, url)
    response = TwitterSession.access_token.get(url).body
    parsed_response = JSON.parse(response)
    parsed_response["id_str"]
  end

  def self.find_user_id(screen_name)
    url = TwitterSession.path_to_url("users/show",
      { :screen_name => screen_name }
    )
    user_id = parse_twitter_user(screen_name, url)
  end

  def fetch_statuses!
    Status.fetch_by_twitter_user_id!(self.class.find_user_id(self.screen_name))
  end
end