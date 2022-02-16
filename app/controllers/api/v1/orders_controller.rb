class Api::V1::OrdersController < ApplicationController
  before_action :set_api_v1_order, only: %i[ show edit update destroy ]

  # GET /api/v1/orders or /api/v1/orders.json
  def index
    @api_v1_orders = Api::V1::Order.all
  end

  # GET /api/v1/orders/1 or /api/v1/orders/1.json
  def show
  end

  # GET /api/v1/orders/new
  def new
    @api_v1_order = Api::V1::Order.new
  end

  # GET /api/v1/orders/1/edit
  def edit
  end

  # POST /api/v1/orders or /api/v1/orders.json
  def create
    @api_v1_order = Api::V1::Order.new(api_v1_order_params)

    respond_to do |format|
      if @api_v1_order.save
        format.html { redirect_to api_v1_order_url(@api_v1_order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @api_v1_order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @api_v1_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/orders/1 or /api/v1/orders/1.json
  def update
    respond_to do |format|
      if @api_v1_order.update(api_v1_order_params)
        format.html { redirect_to api_v1_order_url(@api_v1_order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @api_v1_order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @api_v1_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/orders/1 or /api/v1/orders/1.json
  def destroy
    @api_v1_order.destroy

    respond_to do |format|
      format.html { redirect_to api_v1_orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_order
      @api_v1_order = Api::V1::Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_order_params
      params.require(:api_v1_order).permit(:first_name, :last_name, :shipping_address, :order_total, :paid_at, :order_status)
    end
end
