class CreateSecrets < ActiveRecord::Migration
  def change
    create_table :secrets do |t|
      t.string :title, :null => false

      t.integer :author_id, :null => false
      t.integer :recipient_id, :null => false

      t.timestamps
    end

    add_index :secrets, :author_id
    add_index :secrets, :recipient_id
  end
end
