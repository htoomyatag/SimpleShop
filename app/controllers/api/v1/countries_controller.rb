class Api::V1::CountriesController < ApplicationController
  # before_action :authenticate_user!
  # before_action :is_admins?
  skip_before_action :verify_authenticity_token
  before_action :set_country, only: %i[ show edit update destroy ]


  def index
    @countries = Api::V1::Country.all
    render json: @countries
  end

  def create
    @country = Api::V1::Country.new(country_params)
    @country.save
    redirect_to api_v1_countries_path
  end

  def remove
     @countries = Api::V1::Country.where(:title => params[:name])
     @countries.delete_all
     render json: { message: "#{params[:name]} country removed" }
  end

  # PATCH/PUT /api/v1/countries/1 or /api/v1/countries/1.json
  def update
    respond_to do |format|
      if @country.update(country_params)
        format.html { redirect_to country_url(@country), notice: "Country was successfully updated." }
        format.json { render :show, status: :ok, location: @country }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @country.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
     @country.destroy
     redirect_to api_v1_countries_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Api::V1::Country.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def country_params
      params.require(:country).permit(:title, :country_code)
    end
end
