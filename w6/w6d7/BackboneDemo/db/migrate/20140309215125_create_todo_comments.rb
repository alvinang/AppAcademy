class CreateTodoComments < ActiveRecord::Migration
  def change
    create_table :todo_comments do |t|
      t.integer :todo_id, null: false
      t.text :content, null: false

      t.timestamps
    end
    
    add_index :todo_comments, :todo_id
  end
end
