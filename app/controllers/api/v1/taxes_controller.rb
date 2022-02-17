class Api::V1::TaxesController < ApplicationController
  # before_action :authenticate_user!
  # before_action :is_admins?
  skip_before_action :verify_authenticity_token

  def index
    @taxes = Api::V1::Tax.all
    render json: @taxes
  end

  def create
    @tax = Api::V1::Tax.new(tax_params)
    @tax.save
    redirect_to api_v1_taxes_path
  end

  def remove
     @taxes = Api::V1::Tax.where(:tax_rate => params[:rate])
     @taxes.delete_all
     render json: { message: "#{params[:rate]} Tax removed" }
  end

  private
    def tax_params
      params.require(:tax).permit(:tax_rate, :tax_category)
    end
end
