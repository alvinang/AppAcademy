class Article < ActiveRecord::Base
  has_many :comments,
            class_name: 'Comment',
            foreign_key: :article_id,
            primary_key: :id
            
end
