json.extract! api_v1_order, :id, :first_name, :last_name, :shipping_address, :order_total, :paid_at, :order_status, :created_at, :updated_at
json.url api_v1_order_url(api_v1_order, format: :json)
