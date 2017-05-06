class Listing < ApplicationRecord
  has_attached_file :image, styles: { medium: "250x250>", thumb: "100x100>", default_url: "250x250>"  }, default_url: "missing.jpg"
 validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
