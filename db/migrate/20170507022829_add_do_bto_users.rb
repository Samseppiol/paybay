class AddDoBtoUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :date_of_birth, :datetime
  end
end
