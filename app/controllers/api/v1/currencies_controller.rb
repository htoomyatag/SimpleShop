class Api::V1::CurrenciesController < ApplicationController
  # before_action :authenticate_user!
  # before_action :is_admins?
  skip_before_action :verify_authenticity_token

  def index
    @currencies = Api::V1::Currency.all
    render json: @currencies
  end

  def create
    @currency = Api::V1::Currency.new(country_params)
    @currency.save
    redirect_to api_v1_currencies_path
  end

  def remove
     @currencies = Api::V1::Currency.where(:title => params[:name])
     @currencies.delete_all
     render json: { message: "#{params[:name]} currency removed" }
  end

  private
    def country_params
      params.require(:currency).permit(:title, :currency_code)
    end
end
