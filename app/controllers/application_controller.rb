class ApplicationController < ActionController::API
  before_action :authenticate

  private

  def authenticate
    token = request.headers['Authorization']&.split(' ')&.last

    render json: { error: 'Provide a valid token' } unless token
  end
end
