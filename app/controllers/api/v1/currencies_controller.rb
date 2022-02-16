class Api::V1::CurrenciesController < ApplicationController
  before_action :set_api_v1_currency, only: %i[ show edit update destroy ]

  # GET /api/v1/currencies or /api/v1/currencies.json
  def index
    @api_v1_currencies = Api::V1::Currency.all
  end

  # GET /api/v1/currencies/1 or /api/v1/currencies/1.json
  def show
  end

  # GET /api/v1/currencies/new
  def new
    @api_v1_currency = Api::V1::Currency.new
  end

  # GET /api/v1/currencies/1/edit
  def edit
  end

  # POST /api/v1/currencies or /api/v1/currencies.json
  def create
    @api_v1_currency = Api::V1::Currency.new(api_v1_currency_params)

    respond_to do |format|
      if @api_v1_currency.save
        format.html { redirect_to api_v1_currency_url(@api_v1_currency), notice: "Currency was successfully created." }
        format.json { render :show, status: :created, location: @api_v1_currency }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @api_v1_currency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/currencies/1 or /api/v1/currencies/1.json
  def update
    respond_to do |format|
      if @api_v1_currency.update(api_v1_currency_params)
        format.html { redirect_to api_v1_currency_url(@api_v1_currency), notice: "Currency was successfully updated." }
        format.json { render :show, status: :ok, location: @api_v1_currency }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @api_v1_currency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/currencies/1 or /api/v1/currencies/1.json
  def destroy
    @api_v1_currency.destroy

    respond_to do |format|
      format.html { redirect_to api_v1_currencies_url, notice: "Currency was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_currency
      @api_v1_currency = Api::V1::Currency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_currency_params
      params.require(:api_v1_currency).permit(:title, :currency_code)
    end
end
