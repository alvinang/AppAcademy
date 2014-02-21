class CreateCatRentalRequest < ActiveRecord::Migration
  def change
    create_table :cat_rental_requests do |t|
      t.integer :cat_id, null: true
      t.date :start_date, null: true
      t.date :end_date, null: true
      t.string :status, null: true, inclusion: { in: %w(PENDING APPROVED DENIED) }

      t.timestamps
    end

    add_index :cat_rental_requests, :cat_id
  end
end
