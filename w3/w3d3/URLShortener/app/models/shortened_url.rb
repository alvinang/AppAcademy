require 'SecureRandom'

class ShortenedUrl < ActiveRecord::Base
  validates :long_url, :presence => true

  belongs_to :users,
             :class_name => "User",
             :foreign_key => :user_id,
             :primary_key => :id

   has_many  :visitors,
             :class_name => "Visit",
             :foreign_key => :shortened_url_id,
             :primary_key => :id


  @used_short_urls = []

  def self.random_code
    temp_code = "-"

    while temp_code.split("").include?("-") || temp_code.split("").include?("_") || !(@used_short_urls.include?(temp_code))
      temp_code = SecureRandom::urlsafe_base64(6)
      @used_short_urls << temp_code unless @used_short_urls.include?(temp_code)
    end
    temp_code
  end

  def self.create_for_user_and_long_url!(user, long_url)
    new_long_url = ShortenedUrl.create!(:user_id => user.id, :long_url => long_url, :short_url => ShortenedUrl.random_code)
    new_long_url.short_url
  end

  def convert(short_url)
    ShortenedUrl.find_by_short_url(short_url).long_url
  end

  def num_click
    ShortenedUrl.where(short_url: self.short_url).count
  end

  def num_uniques
    self.visitors.group(:user_id).distinct.count(:user_id).count
  end

  def num_recent_uniques

  end

end
