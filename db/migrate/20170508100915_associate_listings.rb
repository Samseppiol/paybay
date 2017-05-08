class AssociateListings < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :vendor_id, :integer
    add_column :orders, :buyer_id, :integer
  end
end
