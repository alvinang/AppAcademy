class Comment < ActiveRecord::Base
  belongs_to :article,
              class_name: 'Article',
              foreign_key: :article_id,
              primary_key: :id
end
