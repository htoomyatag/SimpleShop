class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session
  #protect_from_forgery with: :exception
  #skip_before_action :verify_authenticity_token


  before_action :current_cart

  def is_admins?

        if current_user.user_role.title == 'Admin'
             render json: { message: 'Logged in as admin.' }, status: :ok
        else
             render json: { message: "No access right to perform this action."}, status: :unauthorized
        end
  end


  private
    def current_cart
      if session[:cart_id]
        cart = Cart.find_by(:id => session[:cart_id])
        if cart.present?
          @current_cart = cart
        else
          session[:cart_id] = nil
        end
      end

      if session[:cart_id] == nil
        @current_cart = Cart.create
        session[:cart_id] = @current_cart.id
      end
    end




end
