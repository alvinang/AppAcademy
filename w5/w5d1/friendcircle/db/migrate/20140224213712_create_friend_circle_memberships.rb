class CreateFriendCircleMemberships < ActiveRecord::Migration
  def change
    create_table :friend_circle_memberships do |t|
      t.integer :friend_circle_id
      t.integer :user_id

      t.timestamps
    end

    add_index :friend_circle_memberships, :user_id
  end
end
