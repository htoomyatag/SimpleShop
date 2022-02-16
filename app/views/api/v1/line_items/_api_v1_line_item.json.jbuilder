json.extract! api_v1_line_item, :id, :quantity, :product_id, :cart_id, :order_id, :created_at, :updated_at
json.url api_v1_line_item_url(api_v1_line_item, format: :json)
