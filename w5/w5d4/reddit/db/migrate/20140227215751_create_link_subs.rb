class CreateLinkSubs < ActiveRecord::Migration
  def change
    create_table :link_subs do |t|
      t.integer :sub_id, null: false
      t.integer :link_id, null: false

      t.timestamps
    end

    add_index :link_subs, :sub_id
    add_index :link_subs, :link_id
  end
end
