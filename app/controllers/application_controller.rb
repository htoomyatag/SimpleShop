class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session
  #protect_from_forgery with: :exception
  #skip_before_action :verify_authenticity_token


  def is_admins?

        if current_user.admin == true
             return true
        else
            render json: { message: "No access right to perform this action."}, status: :unauthorized
            return false
        end
  end





end
