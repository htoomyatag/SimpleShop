class Api::V1::CountriesController < ApplicationController
  # before_action :authenticate_user!
  # before_action :is_admins?
  skip_before_action :verify_authenticity_token

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

  private
    def country_params
      params.require(:country).permit(:title, :country_code)
    end
end
