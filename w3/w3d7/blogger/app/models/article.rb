class Article < ActiveRecord::Base
  has_many :comments,
            class_name: 'Comment',
            foreign_key: :article_id,
            primary_key: :id
            
  has_many :taggings,
            class_name: 'Tagging',
            foreign_key: :article_id,
            primary_key: :id
            
  has_many :tags, through: :taggings, source: :tag
  
  def tag_list
    self.tags.join(", ")
    # self.tags.collect { |tag| tag.name }.join(", ")
  end
  
  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{ |s| s.strip.downcase }.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end
                        
end
