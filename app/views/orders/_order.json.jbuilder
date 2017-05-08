json.extract! order, :id, :address, :city, :state, :postcode, :created_at, :updated_at
json.url order_url(order, format: :json)
