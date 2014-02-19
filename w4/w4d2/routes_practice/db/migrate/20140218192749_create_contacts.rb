class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, presence: true
      t.string :email, presence: true, unique: true
      t.integer :user_id, presence: true

      t.timestamps
    end

    add_index :contacts, :user_id
  end
end
