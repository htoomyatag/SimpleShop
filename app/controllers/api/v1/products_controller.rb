class Api::V1::ProductsController < ApplicationController
  # before_action :authenticate_user!
  # before_action :is_admins?
  skip_before_action :verify_authenticity_token

  def show
    @product = Api::V1::Product.find(params[:id])
    render json: @product
  end

  def index
    @products = Api::V1::Product.all
    render json: @products
  end

  def create
    @store = Api::V1::Product.new(product_params)
    @store.save
    redirect_to api_v1_produts_path
  end

  def remove
     @products = Api::V1::Product.where(:title => params[:name])
     @products.delete_all
     render json: { message: "#{params[:name]} store removed" }
  end

  private
    def product_params
      params.require(:product).permit(:title, :description, :image_url, :price, :sku, :stock, :region_id)
    end
end
