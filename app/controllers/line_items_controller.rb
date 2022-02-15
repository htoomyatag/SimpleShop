class LineItemsController < ApplicationController
  before_action :set_line_item, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token




  # GET /line_items or /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1 or /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items or /line_items.json
  # def create
  #   @line_item = LineItem.new(line_item_params)

  #   respond_to do |format|
  #     if @line_item.save
  #       format.html { redirect_to line_item_url(@line_item), notice: "Line item was successfully created." }
  #       format.json { render :show, status: :created, location: @line_item }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @line_item.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  #   def create
  #   # Find associated product and current cart
  #   chosen_product = Product.find(params[:product_id])
  #   puts chosen_product.id.to_s+"ggggggggggggggggggggggggggggggggggggggg"
  #   current_cart = @current_cart.id
  #   puts current_cart.to_s+"ffffffffffffffffffffffffffff"

  #   # # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
  #   # if current_cart.products.include?(chosen_product.id)
  #   #   # Find the line_item with the chosen_product
  #   #   @line_item = current_cart.line_items.find_by(:product_id => chosen_product.id)
  #   #   # Iterate the line_item's quantity by one
  #   #   @line_item.quantity += 1
  #   # else
  #   #   @line_item = LineItem.new(:cart_id => current_cart.id,:product_id => chosen_product.id, :quantity => 1)
  #   # end

  #   @line_item = LineItem.new(:cart_id => current_cart,:product_id => params[:product_id], :quantity => 3)
  #   # Save and redirect to cart show path
  #   @line_item.save
  #   redirect_to cart_path(current_cart)
  # end

  def create
  # Find associated product and current cart
  chosen_product = Product.find(params[:product_id])
  current_cart = @current_cart

  # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
  if current_cart.products.include?(chosen_product)
    # Find the line_item with the chosen_product
    @line_item = current_cart.line_items.find_by(:product_id => chosen_product)
    # Iterate the line_item's quantity by one
    @line_item.quantity += 1
  else
    @line_item = LineItem.new(:cart_id => current_cart.id,:product_id => chosen_product.id, :quantity => 1)
  end

  # Save and redirect to cart show path
  @line_item.save
  redirect_to cart_path(current_cart)
end


  # PATCH/PUT /line_items/1 or /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to line_item_url(@line_item), notice: "Line item was successfully updated." }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1 or /line_items/1.json
  def destroy
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to line_items_url, notice: "Line item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def line_item_params
      params.require(:line_item).permit(:quantity, :product_id, :cart_id)
    end
end
