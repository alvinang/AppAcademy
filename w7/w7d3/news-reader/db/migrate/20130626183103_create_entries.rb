class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :guid,           null: false
      t.string :link,           null: false
      t.string :title,          null: false
      t.datetime :published_at, null: false
      t.integer :feed_id,       null: false
      t.text :json,             null: false

      t.timestamps
    end
    add_index :entries, :feed_id
    add_index :entries, :guid, unique: true
  end
end
