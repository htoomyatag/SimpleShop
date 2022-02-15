class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session


  def is_admins?

        if current_user.user_role.title == 'Admin'
             render json: { message: 'Logged in as admin.' }, status: :ok
        else
             render json: { message: "No access right to perform this action."}, status: :unauthorized
        end
  end




end
