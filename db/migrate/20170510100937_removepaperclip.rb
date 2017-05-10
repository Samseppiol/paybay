class Removepaperclip < ActiveRecord::Migration[5.0]
  def change
    rename_column :listings, :image_file_name, :images
  end
end
