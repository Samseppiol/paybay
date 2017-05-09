require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
    @update = orders(:two)
      # address: '123 fake street',
      # city: 'Melbourne',
      # state: 'VIC',
      # postcode: '1234'

  end

  test "should create order" do
    assert_difference('Order.count') do
      post listing_orders_url, params: { order: @update }
    end

    assert_redirected_to listing_order_url(Order.last)
  end

  test "should update order" do
    patch listing_orders_url(@order), params: { order: @update }
    assert_redirected_to listing_order_url(@order)
  end
end
