require 'test_helper'

class ListingTest < ActiveSupport::TestCase

  test 'Listing attributes must not be empty' do
    listing = Listing.new
    assert listing.invalid?
    assert listing.errors[:name].any?
    assert listing.errors[:description].any?
    assert listing.errors[:price].any?
  end

  test 'Listing price must be positive' do
    listing = Listing.new(name: 'rails',
                          description: 'this is great',
                          image_file_name: 'test.jpg',
                          id: 3)
    listing.price = -1
    assert listing.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      listing.errors[:price]

    listing.price = 0
    assert listing.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
      listing.errors[:price]

    listing.price = 1
    assert listing.valid?
  end

end
