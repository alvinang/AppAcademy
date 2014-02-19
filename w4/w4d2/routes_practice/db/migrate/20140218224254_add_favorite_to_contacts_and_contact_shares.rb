class AddFavoriteToContactsAndContactShares < ActiveRecord::Migration
  def change
    add_column :contacts, :favorite, :boolean, default: false

    add_column :contact_shares, :favorite, :boolean, default: false
  end
end
