class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :address
      t.string :city
      t.string :state
      t.integer :postcode

      t.timestamps
    end
  end
end
