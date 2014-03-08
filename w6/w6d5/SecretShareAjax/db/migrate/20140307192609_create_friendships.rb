class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :req_friend_id, null: false
      t.integer :accept_friend_id, null: false

      t.timestamps
    end

    add_index :friendships, :req_friend_id
    add_index :friendships, :accept_friend_id
  end
end
