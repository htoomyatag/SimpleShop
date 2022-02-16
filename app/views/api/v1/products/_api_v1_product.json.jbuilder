json.extract! api_v1_product, :id, :title, :description, :order_total, :image_url, :price, :sku, :stock, :created_at, :updated_at
json.url api_v1_product_url(api_v1_product, format: :json)
