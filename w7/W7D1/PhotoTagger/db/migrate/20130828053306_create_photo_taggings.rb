class CreatePhotoTaggings < ActiveRecord::Migration
  def change
    create_table :photo_taggings do |t|
      t.integer :photo_id, :null => false
      t.integer :user_id, :null => false

      t.integer :x_pos, :null => false
      t.integer :y_pos, :null => false

      t.timestamps
    end

    add_index :photo_taggings, :photo_id
    add_index :photo_taggings, :user_id
    add_index :photo_taggings, [:photo_id, :user_id], :unique => true
  end
end
