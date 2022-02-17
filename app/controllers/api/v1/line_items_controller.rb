class Api::V1::LineItemsController < ApplicationController
  before_action :current_cart
  skip_before_action :verify_authenticity_token


  def current_cart
      if session[:cart_id]
        cart = Api::V1::Cart.find_by(:id => session[:cart_id])
        if cart.present?
          @current_cart = cart
        else
          session[:cart_id] = nil
        end
      end

      if session[:cart_id] == nil
        @current_cart = Api::V1::Cart.create
        session[:cart_id] = @current_cart.id
      end
  end


  def add_to_cart
    # Find associated product and current cart
    chosen_product = Api::V1::Product.find(params[:product_id])
    current_cart = @current_cart

    # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
    if current_cart.products.include?(chosen_product)
      # Find the line_item with the chosen_product
      @api_v1_line_item = current_cart.line_items.find_by(:product_id => chosen_product)
      @api_v1_line_item.quantity += params[:quantity].to_i
    else
      @api_v1_line_item = Api::V1::LineItem.new(:cart_id => current_cart.id,:product_id => chosen_product.id, :quantity => params[:quantity])
    end
    @api_v1_line_item.save
    @api_v1_line_items = Api::V1::LineItem.where(:cart_id => current_cart.id)
    render json: @api_v1_line_items
  end

  def add_quantity
      #add quanity plus one
      @api_v1_line_item = Api::V1::LineItem.find(params[:id])
      @api_v1_line_item.quantity += 1
      @api_v1_line_item.save
      @api_v1_line_items = Api::V1::LineItem.where(:cart_id => current_cart)
      render json: @api_v1_line_item
  end

  def reduce_quantity
     #reduce quanity minus one
    @api_v1_line_item = Api::V1::LineItem.find(params[:id])
    if @api_v1_line_item.quantity > 1
      @api_v1_line_item.quantity -= 1
    end
    @api_v1_line_item.save
    render json: @api_v1_line_item
  end

  def remove_allproduct_in_cart
      all_product_in_cart = Api::V1::LineItem.where(:cart_id => params[:cart_id])
      all_product_in_cart.delete_all
     render json: { message: "all items in cart has been removed" }
  end


  def remove_product_in_cart
      desire_product = Api::V1::LineItem.where(:product_id => params[:product_id]).where(:cart_id => params[:cart_id])
      desire_product.delete_all
      @api_v1_line_items = Api::V1::LineItem.where(:cart_id => params[:cart_id])
      render json: @api_v1_line_items
  end






  # PATCH/PUT /api/v1/line_items/1 or /api/v1/line_items/1.json
  def update
    respond_to do |format|
      if @api_v1_line_item.update(api_v1_line_item_params)
        format.html { redirect_to api_v1_line_item_url(@api_v1_line_item), notice: "Line item was successfully updated." }
        format.json { render :show, status: :ok, location: @api_v1_line_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @api_v1_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/line_items/1 or /api/v1/line_items/1.json
  def destroy
    @api_v1_line_item.destroy

    respond_to do |format|
      format.html { redirect_to api_v1_line_items_url, notice: "Line item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_line_item
      @api_v1_line_item = Api::V1::LineItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_line_item_params
      params.require(:api_v1_line_item).permit(:quantity, :product_id, :cart_id)
    end
end
