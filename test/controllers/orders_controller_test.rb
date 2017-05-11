require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers

  setup do
    @order = orders(:one)
    @update = {
      address: '123 fake street',
      city: 'Melbourne',
      state: 'VIC',
      postcode: '1234',
      #vendor: users(:bob),
      #buyer: users(:bill)
    }

  end

  # test "should create order" do
  #   sign_in users(:bill)
  #   listing = listings(:one)
  #
  #   assert_difference('Order.count') do
  #     post listing_orders_url(listing), params: { order: @update }
  #   end
  #
  #   assert_redirected_to listing_url(listing)
  # end

  # test "should update order" do
  #   patch listing_orders_url(@order), params: { order: @update }
  #   assert_redirected_to listing_order_url(@order.listing, @order)
  # end
end
