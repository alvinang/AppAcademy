class CreateFriendCirclePosts < ActiveRecord::Migration
  def change
    create_table :friend_circle_posts do |t|
      t.integer :post_id
      t.integer :friend_circle_id

      t.timestamps
    end
  end
end
