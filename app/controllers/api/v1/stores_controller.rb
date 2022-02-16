class Api::V1::StoresController < ApplicationController
  before_action :set_api_v1_store, only: %i[ show edit update destroy ]

  # GET /api/v1/stores or /api/v1/stores.json
  def index
    @api_v1_stores = Api::V1::Store.all
  end

  # GET /api/v1/stores/1 or /api/v1/stores/1.json
  def show
  end

  # GET /api/v1/stores/new
  def new
    @api_v1_store = Api::V1::Store.new
  end

  # GET /api/v1/stores/1/edit
  def edit
  end

  # POST /api/v1/stores or /api/v1/stores.json
  def create
    @api_v1_store = Api::V1::Store.new(api_v1_store_params)

    respond_to do |format|
      if @api_v1_store.save
        format.html { redirect_to api_v1_store_url(@api_v1_store), notice: "Store was successfully created." }
        format.json { render :show, status: :created, location: @api_v1_store }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @api_v1_store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/stores/1 or /api/v1/stores/1.json
  def update
    respond_to do |format|
      if @api_v1_store.update(api_v1_store_params)
        format.html { redirect_to api_v1_store_url(@api_v1_store), notice: "Store was successfully updated." }
        format.json { render :show, status: :ok, location: @api_v1_store }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @api_v1_store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/stores/1 or /api/v1/stores/1.json
  def destroy
    @api_v1_store.destroy

    respond_to do |format|
      format.html { redirect_to api_v1_stores_url, notice: "Store was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_store
      @api_v1_store = Api::V1::Store.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_store_params
      params.require(:api_v1_store).permit(:title, :region_id)
    end
end
