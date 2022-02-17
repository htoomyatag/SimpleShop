class Api::V1::LineItemsController < ApplicationController
  before_action :set_api_v1_line_item, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /api/v1/line_items or /api/v1/line_items.json
  def index
    @api_v1_line_items = Api::V1::LineItem.all
  end

  # GET /api/v1/line_items/1 or /api/v1/line_items/1.json
  def show
  end

  # GET /api/v1/line_items/new
  def new
    @api_v1_line_item = Api::V1::LineItem.new
  end

  # GET /api/v1/line_items/1/edit
  def edit
  end


  def add_to_cart
    # Find associated product and current cart
    chosen_product = Api::V1::Product.find(params[:product_id])
    current_cart = @current_cart

    # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
    if current_cart.products.include?(chosen_product)
      # Find the line_item with the chosen_product
      @api_v1_line_item = current_cart.line_items.find_by(:product_id => chosen_product)
      # Iterate the line_item's quantity by one
      @api_v1_line_item.quantity += params[:quantity].to_i
    else
      @api_v1_line_item = Api::V1::LineItem.new(:cart_id => current_cart.id,:product_id => chosen_product.id, :quantity => params[:quantity])
    end

    # Save and redirect to cart show path
    @api_v1_line_item.save

    @api_v1_line_items = Api::V1::LineItem.where(:cart_id => current_cart.id)
    render json: @api_v1_line_items
  end



  # POST /api/v1/line_items or /api/v1/line_items.json
   def create
    # Find associated product and current cart
    chosen_product = Api::V1::Product.find(params[:product_id])
    current_cart = @current_cart

    # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
    if current_cart.products.include?(chosen_product)
      # Find the line_item with the chosen_product
      @api_v1_line_item = current_cart.line_items.find_by(:product_id => chosen_product)
      # Iterate the line_item's quantity by one
      @api_v1_line_item.quantity += 1
    else
      @api_v1_line_item = Api::V1::LineItem.new(:cart_id => current_cart.id,:product_id => chosen_product.id, :quantity => 1)
    end

    # Save and redirect to cart show path
    @api_v1_line_item.save
    redirect_to api_v1_cart_path(current_cart)
    
  end

  def add_quantity
    @api_v1_line_item = Api::V1::LineItem.find(params[:id])
    @api_v1_line_item.quantity += 1
    @api_v1_line_item.save
    redirect_to api_v1_cart_path(@current_cart)
  end

  def reduce_quantity
    @api_v1_line_item = Api::V1::LineItem.find(params[:id])
    if @api_v1_line_item.quantity > 1
      @api_v1_line_item.quantity -= 1
    end
    @api_v1_line_item.save
    redirect_to api_v1_cart_path(@current_cart)
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
