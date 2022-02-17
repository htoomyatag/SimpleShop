class Api::V1::StoresController < ApplicationController
  # before_action :authenticate_user!
  # before_action :is_admins?
  skip_before_action :verify_authenticity_token

  def index
    @stores = Api::V1::Store.all
    render json: @stores
  end

  def create
    @store = Api::V1::Store.new(store_params)
    @store.save
    redirect_to api_v1_stores_path
  end

  def remove
     @stores = Api::V1::Store.where(:title => params[:name])
     @stores.delete_all
     render json: { message: "#{params[:name]} store removed" }
  end

  private
    def store_params
      params.require(:store).permit(:title, :region_id)
    end
end
