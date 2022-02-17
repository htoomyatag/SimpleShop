class Api::V1::CountriesController < ApplicationController
  before_action :authenticate_user!
  # before_action :is_admins?
  skip_before_action :verify_authenticity_token
  before_action :set_api_v1_country, only: %i[ show edit update destroy ]

  # GET /api/v1/countries or /api/v1/countries.json
  def index
    @api_v1_countries = Api::V1::Country.all
    render json: @api_v1_countries

  end

  # GET /api/v1/countries/1 or /api/v1/countries/1.json
  def show
  end

  # GET /api/v1/countries/new
  def new
    @api_v1_country = Api::V1::Country.new
  end

  # GET /api/v1/countries/1/edit
  def edit
  end

  # POST /api/v1/countries or /api/v1/countries.json
  def create
    @api_v1_country = Api::V1::Country.new(api_v1_country_params)

    respond_to do |format|
      if @api_v1_country.save
        format.html { redirect_to api_v1_country_url(@api_v1_country), notice: "Country was successfully created." }
        format.json { render :show, status: :created, location: @api_v1_country }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @api_v1_country.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/countries/1 or /api/v1/countries/1.json
  def update
    respond_to do |format|
      if @api_v1_country.update(api_v1_country_params)
        format.html { redirect_to api_v1_country_url(@api_v1_country), notice: "Country was successfully updated." }
        format.json { render :show, status: :ok, location: @api_v1_country }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @api_v1_country.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/countries/1 or /api/v1/countries/1.json
  def destroy
    @api_v1_country.destroy

    respond_to do |format|
      format.html { redirect_to api_v1_countries_url, notice: "Country was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_country
      @api_v1_country = Api::V1::Country.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_country_params
      params.require(:api_v1_country).permit(:title, :country_code)
    end
end
