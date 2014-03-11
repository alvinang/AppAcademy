class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :owner_id, :null => false
      t.string :title, :null => false
      t.string :url, :null => false

      t.timestamps
    end

    add_index :photos, :owner_id
  end
end
