class AddListingToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :listing_id, :integer
  end
end
