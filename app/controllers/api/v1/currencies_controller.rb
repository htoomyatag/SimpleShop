class Api::V1::CurrenciesController < Api::V1::BaseController

  before_action :authenticate_user!


  def index
    respond_with Currency.all
  end

  def create
    respond_with :api, :v1, Currency.create(currency_params)
  end

  def destroy
    respond_with Currency.destroy(params[:id])
  end

  def update
    currency = Currency.find(params["id"])
    currency.update_attributes(currency_params)
    respond_with currency, json: currency
  end

  private

  def currency_params
    params.require(:currency).permit(:id, :title, :currency_code)
  end
end