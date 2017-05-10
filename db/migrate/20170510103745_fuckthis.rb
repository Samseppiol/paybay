class Fuckthis < ActiveRecord::Migration[5.0]
  def change
    rename_column :listings, :image, :image_file_name
  end
end
