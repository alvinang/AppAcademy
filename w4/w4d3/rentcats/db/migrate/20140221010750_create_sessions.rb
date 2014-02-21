class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :user_id, null: false
      t.string :device, null: true
      t.string :token, null: false

      t.timestamps
    end
    add_index :sessions, :user_id
  end
end
