class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, presence: true
      t.integer :user_id, presence: true

      t.timestamps
    end

    add_index :groups, :user_id
    add_index :groups, [:name, :user_id], unique: true
  end
end
