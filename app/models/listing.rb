class Listing < ApplicationRecord
  validates :name, :description, :image_file_name, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :name, uniqueness: true
  validates :image_file_name, allow_blank: true, format: {
    with: %r{\.(gif|jpg|jpeg|png)\Z}i,
    message: 'Must be a url for a gif, jpg or png image file.'
  }

  has_attached_file :image, styles: { medium: "250x250>", thumb: "100x100>", default_url: "250x250>"  }, default_url: "missing.jpg"
 validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
