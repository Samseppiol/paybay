require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test 'Order attributes must not be empty' do
    order = Order.new
    assert order.invalid?
    assert order.errors[:address].any?
    assert order.errors[:city].any?
    assert order.errors[:state].any?
    assert order.errors[:postcode].any?
  end

  test 'Postcode is valid' do
    order = Order.new(address: '123 fake street',
                      city: 'Fakebourne',
                      state: 'vic')
    order.postcode = '321'
    assert order.invalid?
    assert_equal ["is too short (minimum is 4 characters)"], order.errors[:postcode]
    order.postcode = 'abcd'
    assert order.invalid?
    assert_equal ["is not a number", "is too short (minimum is 4 characters)"], order.errors[:postcode]

    order.postcode = '3223'
    assert order.valid?
  end


  test 'City name is valid' do
    order = Order.new(address: '123 fake street',
                      state: 'vic',
                      postcode: '3198')
    order.city = 'a'
    assert order.invalid?
    assert_equal ["is too short (minimum is 2 characters)"], order.errors[:city]

    order.city = 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz'
    assert order.invalid?
    assert_equal ["is too long (maximum is 50 characters)"], order.errors[:city]

    order.city = 'melbourne'
    assert order.valid?
  end

  test 'Address is not empty' do
    order = Order.new(city: 'melb',
                      state: 'vic',
                      postcode: '3198')
    order.address = ' '
    assert order.invalid?
    assert_equal ["can't be blank", "is too short (minimum is 2 characters)"], order.errors[:address]

    order.address = '123 fake street'
    assert order.valid?
  end


end
