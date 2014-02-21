class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.integer :age, numericality: { only_integer: true }, null: false
      t.date :birth_date
      t.integer :user_id, null: false
      t.string :color, inclusion: { in: %w(calico black white brown green) }, null: false
      t.string :name, null: false
      t.string :sex, inclusion: { in: %w(M F) }, null: false

      t.timestamps
    end

    add_index :cats, :user_id
  end
end
