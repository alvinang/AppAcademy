class DropNameAndEmailFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :email, :string
    rename_column :users, :name, :username
  end
end
