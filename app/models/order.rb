class Order < ApplicationRecord
  validates :address, :city, :state, :postcode, presence: true
  validates_numericality_of :postcode, :only_integer => true, :allow_nil => true
  validates_length_of :postcode, {:minimum => 4, :maximum => 4}
  validates_length_of :address, :city, :state, {:minimum => 2, :maximum => 50}

end
