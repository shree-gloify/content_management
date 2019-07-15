class ApplicationController < ActionController::API
  include Pundit
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::Serialization
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # rescue_from StandardError, with: :internal_server_error
  # rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  # def not_found(exception)
  #   render json: { error: exception.message }, status: :not_found
  # end

  # def internal_server_error(exception)
  #   if Rails.env.development?
  #     response = { type: exception.class.to_s, message: exception.message, backtrace: exception.backtrace }
  #   else
  #     response = { error: "Internal Server Error" }
  #   end
  #   render json: response, status: :internal_server_error
  # end

  def user_not_authorized
    render json: {error: "You cannot perform this action."}, status: 401
  end

end
