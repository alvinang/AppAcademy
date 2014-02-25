class CreateFriendCircles < ActiveRecord::Migration
  def change
    create_table :friend_circles do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end

    add_index :friend_circles, :user_id
  end
end
