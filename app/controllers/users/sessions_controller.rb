class Users::SessionsController < Devise::SessionsController

  skip_before_action :verify_authenticity_token
  respond_to :json
  private
  def respond_with(resource, _opts = {})
    render json: { message: 'Logged.' }, status: :ok
  end
  def respond_to_on_destroy
    current_user ? log_out_success : log_out_failure
  end
  def log_out_success
    render json: { message: "Logged out." }, status: :ok
  end
  def log_out_failure
    render json: { message: "Logged out failure."}, status: :unauthorized
  end
  def is_admins?
        if current_user.user_role_id == "1"
             render json: { message: 'Logged in as admin.' }, status: :ok
        else
             render json: { message: "No access right to perform this action."}, status: :unauthorized
        end
  end

end