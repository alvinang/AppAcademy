# from http://stackoverflow.com/questions/2385186/check-if-internet-connection-exists-with-ruby
require 'open-uri'

class Status < ActiveRecord::Base
  validates :body, :id_str, :twitter_user_id, presence: true
  validates :body, length: { maximum: 140 }
  validates :id_str, uniqueness: true

  belongs_to :user,
             :class_name => "User",
             :foreign_key => :twitter_user_id,
             :primary_key => :twitter_user_id

  def self.fetch_by_twitter_user_id!(twitter_user_id)
    response = TwitterSession.get(
      "statuses/user_timeline",
      { :user_id => twitter_user_id }
    )

    self.parse_json(response)
  end

  def self.parse_json(response)
    statuses = self.where(:twitter_user_id => response.first["user"]["id_str"]).pluck(:id_str)

    response.each do |tweet|
      unless statuses.include?(tweet["id"])
        Status.create(:body => tweet["text"],
                   :id_str => tweet["id"],
                   :twitter_user_id => tweet["user"]["id_str"]
        )
      end
    end
  end

  def self.post(body)
    response = TwitterSession.post(
      "statuses/update",
      { :status => body }
    )
    # p response
    self.parse_json([response])
  end

  def self.internet_connection?
    begin
      true if open("http://www.google.com/")
    rescue
      false
    end
  end

  def self.get_by_twitter_user_id(twitter_user_id)
    if self.internet_connection?
      fetch_by_twitter_user_id!(twitter_user_id)
    else
      statuses = self.where(:twitter_user_id => twitter_user_id)
      # p statuses
    end

  end

end