class Api::V1::OrdersController < ApplicationController

  skip_before_action :verify_authenticity_token

  def add_to_order

     first_name = params[:first_name]
     last_name = params[:last_name]
     shipping_address = params[:shipping_address]
     total_amount = calculate_total_amount(params[:cart_id])

    @api_v1_order = Api::V1::Order.new(:first_name => first_name,:last_name => last_name,:shipping_address => shipping_address,:order_total => total_amount.round(2))
    @current_cart.line_items.each do |item|
      @api_v1_order.line_items << item
      item.cart_id = nil
    end
    @api_v1_order.save
    Api::V1::Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    render json: @api_v1_order
end


  def calculate_total_amount(cart)
     
     sum = 0
        Api::V1::LineItem.where(:cart_id=>1).each do |line_item|
          #calcualte tax rate for product
          tax_rate = line_item.product.region.tax.tax_rate * line_item.product.price
          #plus product value with tax
          product_price_with_tax = tax_rate + line_item.product.price
          #total product value
          sum+= line_item.quantity * product_price_with_tax
        end
        return sum
  end




  private
  
    # Only allow a list of trusted parameters through.
    def api_v1_order_params
      params.require(:api_v1_order).permit(:first_name, :last_name, :shipping_address, :order_total, :paid_at, :payment_status)
    end
end
