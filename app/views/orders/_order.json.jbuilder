json.extract! order, :id, :customer_name, :shipping_address, :order_total, :paid_at, :created_at, :updated_at
json.url order_url(order, format: :json)
