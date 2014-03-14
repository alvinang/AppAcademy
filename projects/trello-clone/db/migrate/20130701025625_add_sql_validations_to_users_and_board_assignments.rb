class AddSqlValidationsToUsersAndBoardAssignments < ActiveRecord::Migration
  def change
    change_column :users, :email, :string, null: false
    change_column :users, :password_digest, :string, null: false
    change_column :board_assignments, :user_id, :integer, null: false
    change_column :board_assignments, :board_id, :integer, null: false
  end
end
