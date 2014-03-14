class CreateCardAssignments < ActiveRecord::Migration
  def change
    create_table :card_assignments do |t|
      t.integer :card_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    
    add_index :card_assignments, :card_id
    add_index :card_assignments, :user_id
  end
end
