class AddCommentToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :comment, :string,  :length => 1024
  end
end
