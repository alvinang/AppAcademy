class AddComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment, presence: true
      t.integer :user_id, presence: true
      t.integer :contact_id, presence: true

      t.timestamps
    end

    add_index :comments, :user_id
    add_index :comments, [:user_id, :contact_id], unique: true
  end
end
