class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :album_id, null: false
      t.string :bonus, null: false
      t.text :lyrics, null: false
      t.string :title, null: false

      t.timestamps
    end
    
    add_index :tracks, :album_id
  end
end
