class Listing < ApplicationRecord
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  belongs_to :user
  has_many :orders
  validates :name, :description, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :name, uniqueness: true
  # validates :image_file_name, allow_blank: true, format: {
  #   with: %r{\.(gif|jpg|jpeg|png)\Z}i,
  #   message: 'Must be a url for a gif, jpg or png image file.'
  # }

  has_attached_file :image, styles: { medium: "250x250>", thumb: "100x100>" }, default_url: "missing.jpg"
 validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


 private
 def ensure_not_referenced_by_any_line_item
   unless line_items.empty?
     errors.add(:base, 'Line Items present') 
     throw :abort
   end
 end
end
