class Api::V1::RegionsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admins?
  skip_before_action :verify_authenticity_token
  before_action :set_api_v1_region, only: %i[ show edit update destroy ]

  # GET /api/v1/regions or /api/v1/regions.json
  def index
    @api_v1_regions = Api::V1::Region.all
  end

  # GET /api/v1/regions/1 or /api/v1/regions/1.json
  def show
  end

  # GET /api/v1/regions/new
  def new
    @api_v1_region = Api::V1::Region.new
  end

  # GET /api/v1/regions/1/edit
  def edit
  end

  # POST /api/v1/regions or /api/v1/regions.json
  def create
    @api_v1_region = Api::V1::Region.new(api_v1_region_params)

    respond_to do |format|
      if @api_v1_region.save
        format.html { redirect_to api_v1_region_url(@api_v1_region), notice: "Region was successfully created." }
        format.json { render :show, status: :created, location: @api_v1_region }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @api_v1_region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/regions/1 or /api/v1/regions/1.json
  def update
    respond_to do |format|
      if @api_v1_region.update(api_v1_region_params)
        format.html { redirect_to api_v1_region_url(@api_v1_region), notice: "Region was successfully updated." }
        format.json { render :show, status: :ok, location: @api_v1_region }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @api_v1_region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/regions/1 or /api/v1/regions/1.json
  def destroy
    @api_v1_region.destroy

    respond_to do |format|
      format.html { redirect_to api_v1_regions_url, notice: "Region was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_region
      @api_v1_region = Api::V1::Region.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_region_params
      params.require(:api_v1_region).permit(:title, :country_id, :currency_id, :tax_id)
    end
end
