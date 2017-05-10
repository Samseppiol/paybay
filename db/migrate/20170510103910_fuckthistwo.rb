class Fuckthistwo < ActiveRecord::Migration[5.0]
  def change
    remove_column :listings, :images
  end
end
