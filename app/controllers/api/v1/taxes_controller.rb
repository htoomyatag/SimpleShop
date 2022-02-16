class Api::V1::TaxesController < ApplicationController
  before_action :set_api_v1_tax, only: %i[ show edit update destroy ]

  # GET /api/v1/taxes or /api/v1/taxes.json
  def index
    @api_v1_taxes = Api::V1::Tax.all
  end

  # GET /api/v1/taxes/1 or /api/v1/taxes/1.json
  def show
  end

  # GET /api/v1/taxes/new
  def new
    @api_v1_tax = Api::V1::Tax.new
  end

  # GET /api/v1/taxes/1/edit
  def edit
  end

  # POST /api/v1/taxes or /api/v1/taxes.json
  def create
    @api_v1_tax = Api::V1::Tax.new(api_v1_tax_params)

    respond_to do |format|
      if @api_v1_tax.save
        format.html { redirect_to api_v1_tax_url(@api_v1_tax), notice: "Tax was successfully created." }
        format.json { render :show, status: :created, location: @api_v1_tax }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @api_v1_tax.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/taxes/1 or /api/v1/taxes/1.json
  def update
    respond_to do |format|
      if @api_v1_tax.update(api_v1_tax_params)
        format.html { redirect_to api_v1_tax_url(@api_v1_tax), notice: "Tax was successfully updated." }
        format.json { render :show, status: :ok, location: @api_v1_tax }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @api_v1_tax.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/taxes/1 or /api/v1/taxes/1.json
  def destroy
    @api_v1_tax.destroy

    respond_to do |format|
      format.html { redirect_to api_v1_taxes_url, notice: "Tax was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_tax
      @api_v1_tax = Api::V1::Tax.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_tax_params
      params.require(:api_v1_tax).permit(:tax_category, :tax_rate)
    end
end
