class ApplicationController < ActionController::API
  include ActionController::Serialization
  # rescue_from StandardError, with: :internal_server_error
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  
  respond_to :json

  private

  def not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

end
