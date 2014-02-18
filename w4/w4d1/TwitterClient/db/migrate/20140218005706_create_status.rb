class CreateStatus < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.text :body, null: false, limit: 140
      t.string :id_str, null: false, unique: true
      t.string :twitter_user_id, null: false

      t.timestamps
    end
  end
end
