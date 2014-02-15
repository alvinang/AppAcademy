class Visit < ActiveRecord::Base

  validates :user_id, :uniqueness => true

  belongs_to :user,
             :class_name => "User",
             :foreign_key => :user_id,
             :primary_key => :id

  belongs_to :shortened_url,
             :class_name => "ShortenedUrl",
             :foreign_key => :shortened_url_id,
             :primary_key => :id

  def self.record_visit!(user, shortened_url)
    Visit.create!(:user_id => user.id, :shortened_url_id => ShortenedUrl.find_by_short_url(shortened_url).id)
  end


end