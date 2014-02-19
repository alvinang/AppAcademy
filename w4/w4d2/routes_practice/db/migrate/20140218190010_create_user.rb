class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, presence: true
      t.string :email, presence: true, unique: true

      t.timestamps
    end

    add_index :users, :email
  end
end
